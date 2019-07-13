# frozen_string_literal: true

module Lite
  module Statistics
    class Kurtosis < Lite::Statistics::Base

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
        standard_deviation**4
      end

      def standard_deviation
        Lite::Statistics::StandardDeviation.calculate(collection)
      end

      def sum_quarted_deviation
        memo_mean = mean
        collection.inject(0) { |acc, val| acc + (val - memo_mean)**4 }
      end

    end
  end
end