# frozen_string_literal: true

module Lite
  module Statistics
    class ValueFromPercentile < Lite::Statistics::Base

      def calculate(percentile)
        return if collection.empty?

        value_index = (percentile.to_f / 100 * collection.size).ceil
        collection.sort[value_index]
      end

    end
  end
end
