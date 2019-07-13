# frozen_string_literal: true

module Lite
  module Statistics
    class Mean < Lite::Statistics::Base

      def calculate
        return if collection.empty?

        collection.sum / collection.size.to_f
      end

    end
  end
end
