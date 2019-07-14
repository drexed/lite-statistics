# frozen_string_literal: true

module Lite
  module Statistics
    class SampleCoefficientOfVariation < Lite::Statistics::Base

      def calculate
        return if collection.empty?

        sample_standard_deviation / mean
      end

      private

      def mean
        Lite::Statistics::Mean.calculate(collection)
      end

      def sample_standard_deviation
        Lite::Statistics::SampleStandardDeviation.calculate(collection)
      end

    end
  end
end
