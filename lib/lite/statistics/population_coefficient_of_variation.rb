# frozen_string_literal: true

module Lite
  module Statistics
    class PopulationCoefficientOfVariation < Lite::Statistics::Base

      def calculate
        return if collection.empty?

        population_standard_deviation / mean
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
