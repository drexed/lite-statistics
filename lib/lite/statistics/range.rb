# frozen_string_literal: true

module Lite
  module Statistics
    class Range < Lite::Statistics::Base

      def calculate
        return if collection.empty?

        sorted = collection.sort
        sorted.last - sorted.first
      end

    end
  end
end
