# frozen_string_literal: true

require 'ruby-graphviz'

require_relative 'graph_exporter'

module Exporters
  class GroupedGraphExporter < GraphExporter

    private

    def edges_for(bindings)
      edges = []
      bindings.each do |b|
        edge = edges.find { edge_for?(_1, b) }
        edges << (edge = build_edge(b)) unless edge

        increment_edge!(edge, b)
      end

      edges.map do |edge|
        edge.options[:tooltip] = edge.options[:tooltip].join("\n")
        edge
      end
    end

    def build_edge(b)
      edge = super
      edge.options[:penwidth] = 0
      edge.options[:label] = 0
      edge.options[:tooltip] = []
      edge.options[:labelfloat] = true
      edge
    end

    def increment_edge!(edge, b)
      edge.options[:penwidth] += 1
      edge.options[:label] += 1
      edge.options[:tooltip] << b.event_name
    end

    def edge_for?(edge, b)
      edge.from == b.from_context && edge.to == b.to_context
    end
  end
end
