# frozen_string_literal: true

module Lite
  module Statistics
    class PercentileFromValue < Lite::Statistics::Base

      def calculate(value)
        return if collection.empty?

        (collection.sort.index(value) / collection.size.to_f * 100).ceil
      end

    end
  end
end
