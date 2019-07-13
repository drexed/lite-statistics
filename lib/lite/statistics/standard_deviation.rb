# frozen_string_literal: true

module Lite
  module Statistics
    class StandardDeviation < Lite::Statistics::Base

      def calculate
        return if collection.size < 2

        Math.sqrt(variance)
      end

      private

      def variance
        Lite::Statistics::Variance.calculate(collection)
      end

    end
  end
end
