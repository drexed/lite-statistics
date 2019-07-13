# frozen_string_literal: true

module Lite
  module Statistics
    class Median < Lite::Statistics::Base

      # rubocop:disable Metrics/AbcSize
      def calculate
        return if collection.empty?

        length = collection.size
        sorted = collection.sort

        return sorted[length / 2] unless length.even?

        (sorted[(length / 2) - 1] + sorted[length / 2]) / 2.0
      end
      # rubocop:enable Metrics/AbcSize

    end
  end
end
