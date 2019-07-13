# frozen_string_literal: true

module Lite
  module Statistics
    class PopulationVariance < Lite::Statistics::Base

      def calculate
        return if collection.empty?

        memo_mean = mean
        sum = collection.inject(0) { |accumulator, value| accumulator + (value - memo_mean)**2 }
        sum / collection.size.to_f
      end

      private

      def mean
        Lite::Statistics::Mean.calculate(collection)
      end

    end
  end
end
