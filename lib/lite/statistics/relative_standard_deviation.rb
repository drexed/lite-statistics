# frozen_string_literal: true

module Lite
  module Statistics
    class RelativeStandardDeviation < Lite::Statistics::Base

      def calculate
        return if collection.empty?

        (population_standard_deviation / mean) * 100.0
      end

      private

      def mean
        Lite::Statistics::Mean.calculate(collection)
      end

      def population_standard_deviation
        Lite::Statistics::PopulationStandardDeviation.calculate(collection)
      end

    end
  end
end
