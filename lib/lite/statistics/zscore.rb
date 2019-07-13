# frozen_string_literal: true

module Lite
  module Statistics
    class Zscore < Lite::Statistics::Base

      def calculate
        return if collection.size < 2

        memo_standard_deviation = standard_deviation
        return Array.new(collection.size, 0) if memo_standard_deviation.zero?

        memo_mean = mean
        collection.collect { |val| (val - memo_mean) / memo_standard_deviation }
      end

      private

      def mean
        Lite::Statistics::Mean.calculate(collection)
      end

      def standard_deviation
        Lite::Statistics::StandardDeviation.calculate(collection)
      end

    end
  end
end
