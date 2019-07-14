# frozen_string_literal: true

module Lite
  module Statistics
    class SampleVariance < Lite::Statistics::Base

      def calculate
        return if collection.empty?

        memo_mean = mean
        sum = collection.inject(0) { |acc, val| acc + (val - memo_mean)**2 }
        sum / (collection.size.to_f - 1)
      end

      private

      def mean
        Lite::Statistics::Mean.calculate(collection)
      end

    end
  end
end
