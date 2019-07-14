# frozen_string_literal: true

module Lite
  module Statistics
    class PopulationStandardError < Lite::Statistics::Base

      def calculate
        return if collection.empty?

        sample_standard_deviation / Math.sqrt(collection.size)
      end

      private

      def sample_standard_deviation
        Lite::Statistics::SampleStandardDeviation.calculate(collection)
      end

    end
  end
end
