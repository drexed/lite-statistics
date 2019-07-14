# frozen_string_literal: true

module Lite
  module Statistics
    class PopulationZscore < Lite::Statistics::Base

      def calculate
        return if collection.size < 2

        memo_population_standard_deviation = population_standard_deviation
        return Array.new(collection.size, 0) if memo_population_standard_deviation.zero?

        memo_mean = mean
        collection.collect { |val| (val - memo_mean) / memo_population_standard_deviation }
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
