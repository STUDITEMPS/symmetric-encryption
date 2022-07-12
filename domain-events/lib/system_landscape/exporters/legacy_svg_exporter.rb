# frozen_string_literal: true

require 'ruby-graphviz'

module Exporters
  class LegacySvgExporter < GroupedGraphExporter
    private

    def format
      :svg
    end
  end
end
