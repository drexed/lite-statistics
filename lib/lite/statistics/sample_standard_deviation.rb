# frozen_string_literal: true

module Lite
  module Statistics
    class SampleStandardDeviation < Lite::Statistics::Base

      def calculate
        return if collection.size < 2

        Math.sqrt(sample_variance)
      end

      private

      def sample_variance
        Lite::Statistics::SampleVariance.calculate(collection)
      end

    end
  end
end
