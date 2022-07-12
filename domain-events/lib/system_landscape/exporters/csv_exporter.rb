# frozen_string_literal: true

require 'csv'

module Exporters
  class CsvExporter
    attr_reader :context_team_map

    def initialize(context_team_map:, **)
      @context_team_map = context_team_map
    end

    def call(bindings:, output:)
      CSV.open("#{output}.csv", 'w', headers: %w[from to event from_team to_team]) do |csv|
        csv << %w[from to event routing_key from_team to_team]
        bindings.each do |b|
          csv << [
            b.from_context,
            b.to_context,
            b.event_name,
            b.via,
            team_name(b.from_context),
            team_name(b.to_context)
          ]
        end
      end
    end

    private

    def team_name(context)
      context_team_map[context] || '<Unknown>'
    end
  end
end
