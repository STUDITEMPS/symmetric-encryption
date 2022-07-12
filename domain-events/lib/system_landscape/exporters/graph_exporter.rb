# frozen_string_literal: true

require 'ruby-graphviz'

module Exporters
  class GraphExporter
    DARK = '#000000'
    LIGHT = '#FFFFFF'

    Edge = Struct.new(:from, :to, :options, keyword_init: true)

    attr_reader :context_team_map, :team_color_map

    def initialize(context_team_map:, team_color_map:, **)
      @context_team_map = context_team_map
      @team_color_map = team_color_map
    end

    def call(bindings:, output:, **)
      name = output.split('/').last
      graph = build_graph(name)

      edges_for(bindings).each do |edge|
        add_edge(graph, edge)
      end

      graph.output(format => "#{output}.#{format}")
    end

    private

    def edges_for(bindings)
      bindings.map { build_edge(_1) }
    end

    def build_edge(b)
      Edge.new(from: b.from_context, to: b.to_context, options: { label: b.event_name })
    end

    def format
      :dot
    end

    def add_edge(graph, edge)
      from = add_node(graph, edge.from)
      to = add_node(graph, edge.to)

      graph.add_edge(from, to, edge.options)
    end

    def add_node(graph, context)
      graph.add_node(context, node_options(context))
    end

    def build_graph(name)
      GraphViz.new(:G, type: :digraph, layout: 'dot', label: "System Landscape - #{name}", labelloc: 't', overlap: false, pack: true, splines: true)
      # GraphViz.new(:G, type: :digraph, layout: 'neato', label: "System Landscape - #{name}", labelloc: 't', overlap: false, pack: true, splines: true)
    end

    def node_options(context)
      team_color = team_color_for(context)
      {
        shape: 'box',
        style: 'filled',
        fontcolor: select_foreground_color(team_color),
        fillcolor: team_color
      }
    end

    # @see https://makandracards.com/makandra/496431-ruby-how-to-convert-hex-color-codes-to-rgb-or-rgba
    # @see https://stackoverflow.com/questions/3942878/how-to-decide-font-color-in-white-or-black-depending-on-background-color
    def select_foreground_color(background_color)
      red, green, blue = background_color.match(/^#(..)(..)(..)$/).captures.map(&:hex)
      # Default value is 186 but 150 gives nicer results
      red * 0.299 + green * 0.587 + blue * 0.114 > 150 ? DARK : LIGHT
    end

    def team_color_for(context)
      team_color_map[context_team_map[context]] || LIGHT
    end
  end
end
