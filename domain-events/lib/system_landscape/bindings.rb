# frozen_string_literal: true

require 'uri'
require 'rabbitmq/http/client'

##
# Fetch all bindings from RabbitMQ
class Bindings
  Binding = Struct.new(:from, :to, :via, :type, keyword_init: true) do
    include Comparable

    def from_context
      # Fix for elixir apps that bind via intermediat exchange
      # example: (exchange) [queue]
      # (freigabe) via `freigabe.arbeitszeit-geloescht` -> (arbeitszeitbestaetigung.freigabe.arbeitszeit-geloescht)
      # (arbeitszeitbestaetigung.freigabe.arbeitszeit-geloescht) via `freigabe.arbeitszeit-geloescht` -> [arbeitszeitbestaetigung.freigabe.arbeitszeit-geloescht]
      # solution: we only look at the last binding but need to change the `from_context` to the second part`
      # assumption: that are the only occurances of `<context>.<context>.<event>`
      if (match = from.match(/^(\w+)\.(\w+)\.([\w-]+)$/))
        match[2]
      else
        from.split('.').first
      end
    end

    def to_context
      to.split('.').first
    end

    def event_name
      via.split('.').last
    end

    def relevant?
      not_to_same_context? && existing_from_and_to? && valid_event_name?
    end

    def not_to_same_context?
      from_context != to_context
    end

    def existing_from_and_to?
      [from, to].all? { !_1.nil? && _1 != '' }
    end

    def valid_event_name?
      event_name && event_name != '' && event_name != '#'
    end

    def inspect
      "<#Binding #{from_context} -(#{via})-> #{to_context} (#{type})>"
    end
    alias_method :to_s, :inspect

    def <=>(other)
      comparator <=> other.comparator
    end

    def eql?(other)
      (self <=> other).zero?
    end

    def hash
      comparator.hash
    end

    def comparator
      [
        from_context, to_context, event_name
      ].map(&:to_s)
    end
  end

  attr_reader :url

  def initialize(url: ENV['RABBITMQ_URL'])
    @url = url
  end

  def call
    raise 'No valid rabbitmq url provided' unless url

    uri = URI.parse(url)
    vhost = uri.path.sub('/', '')

    uri.path = ''
    uri.scheme = 'https'
    client = RabbitMQ::HTTP::Client.new(uri.to_s)

    client.list_bindings(vhost).map { build_binding(_1) }
  end

  private

  def build_binding(raw_binding)
    Binding.new(
      from: raw_binding['source'],
      to: raw_binding['destination'],
      via: raw_binding['routing_key'],
      type: raw_binding['destination_type']
    )
  end
end
