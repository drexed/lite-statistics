# frozen_string_literal: true

module Lite
  module Statistics
    class Mode < Lite::Statistics::Base

      def calculate
        return if collection.empty?

        top_two = frequency.sort_by { |_, val| -val }.take(2)
        return if top_two.first.last == top_two.last.last

        top_two.first.first
      end

      private

      def frequency
        Lite::Statistics::Frequency.calculate(collection)
      end

    end
  end
end
