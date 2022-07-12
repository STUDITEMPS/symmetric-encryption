# frozen_string_literal: true

require 'ruby-graphviz'

require_relative 'legacy_svg_exporter'

module Exporters
  class OverviewSvgExporter < LegacySvgExporter
    private

    def edges_for(bindings)
      filterd_bindings = filter_unkown_contexts(bindings)
      super(filterd_bindings)
    end

    def filter_unkown_contexts(bindings)
      bindings.select { context_team_map[_1.from_context] && context_team_map[_1.to_context] }
    end
  end
end
