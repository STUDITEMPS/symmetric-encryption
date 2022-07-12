# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'

require 'json'
require './lib/system_landscape/bindings'
Dir['./lib/system_landscape/exporters/*.rb'].each { |f| require f }

class SystemLandscape
  OUTPUT = './docs/system_landscape'

  DEFAULT_EXPORTS = [
    'Csv:unrestricted:sorted_bindings',
    'Csv:system_landscape',
    'LegacySvg:legacy_landscape',
    'OverviewSvg:overview_landscape'
  ].freeze

  # NOTE: If an app/service consumes for multiple contexts via one app specific exchange we list this here.
  # This does affact especialy ruby/hutch apps.
  # - At the moment I treat them as separate exchanges/contexts/apps.
  # - I am not sure how we coult determine the correct target context for a given exchange.
  DUMMY_CONTEXTS = {
    shinobi: 'Phteinpferd',
    jobmensa: 'Jobmensa',
    matchees: 'Matcheese',
    clubhouse: 'StudentServices',
    'sv-einordnung': 'Jehovakel'
  }.transform_keys(&:to_s).freeze

  attr_reader :rabbitmq_url, :output

  def initialize(rabbitmq_url: ENV['RABBITMQ_URL'], output: OUTPUT)
    @rabbitmq_url = rabbitmq_url
    @output = output
  end

  def call(exports: DEFAULT_EXPORTS)
    exports.each do |export|
      export!(*export.split(':'))
    end
  end

  private

  def export!(exporter_name, name, bindings = :relevant_bindings)
    exporter_klass = Object.const_get("Exporters::#{exporter_name}Exporter")
    exporter = exporter_klass.new(
      team_color_map: team_color_map,
      context_team_map: context_team_map
    )
    exporter.call(
      bindings: send(bindings),
      output: "#{output}/#{name}"
    )
  end

  def team_color_map
    return @team_color_map if defined?(@team_color_map)

    @team_color_map = JSON.parse(File.read('bin/teams.json'))
  end

  def context_team_map
    return @context_team_map if defined?(@context_team_map)

    @context_team_map = {}
    Dir['bounded-contexts/*'].each do |path|
      team = get_team_name(path)
      context = path.split('/')[1]
      @context_team_map[context] = team
    end
    @context_team_map.merge!(DUMMY_CONTEXTS)
  end

  def get_team_name(path)
    if File.exist?("#{path}/.team")
      File.read("#{path}/.team").gsub(/\s/, '')
    else
      warn "No `.team` file found in #{path}"
      nil
    end
  end

  def bindings
    @bindings ||= Bindings.new(url: rabbitmq_url).call
  end

  def sorted_bindings
    @sorted_bindings ||=
      bindings.uniq.sort
  end

  def relevant_bindings
    @relevant_bindings ||= sorted_bindings.select(&:relevant?)
  end
end
