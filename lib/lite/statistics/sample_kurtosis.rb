# frozen_string_literal: true

module Lite
  module Statistics
    class SampleKurtosis < Lite::Statistics::Base

      def calculate
        return if collection.empty?

        length = collection.size
        return 0 if length == 1

        sum_quarted_deviation / ((length - 1) * quarted_standard_deviation.to_f)
      end

      private

      def mean
        Lite::Statistics::Mean.calculate(collection)
      end

      def quarted_standard_deviation
        sample_standard_deviation**4
      end

      def sample_standard_deviation
        Lite::Statistics::SampleStandardDeviation.calculate(collection)
      end

      def sum_quarted_deviation
        memo_mean = mean
        collection.inject(0) { |acc, val| acc + (val - memo_mean)**4 }
      end

    end
  end
end
