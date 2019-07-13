# frozen_string_literal: true

module Lite
  module Statistics
    class PopulationStandardDeviation < Lite::Statistics::Base

      def calculate
        return if collection.empty?

        Math.sqrt(population_variance)
      end

      private

      def population_variance
        Lite::Statistics::PopulationVariance.calculate(collection)
      end

    end
  end
end
