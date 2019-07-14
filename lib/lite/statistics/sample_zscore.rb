# frozen_string_literal: true

module Lite
  module Statistics
    class SampleZscore < Lite::Statistics::Base

      def calculate
        return if collection.size < 2

        memo_sample_standard_deviation = sample_standard_deviation
        return Array.new(collection.size, 0) if memo_sample_standard_deviation.zero?

        memo_mean = mean
        collection.collect { |val| (val - memo_mean) / memo_sample_standard_deviation }
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
