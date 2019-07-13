# frozen_string_literal: true

module Lite
  module Statistics
    class Frequency < Lite::Statistics::Base

      def calculate
        return if collection.empty?

        collection.each_with_object(Hash.new(0)) { |val, hash| hash[val] += 1 }
      end

    end
  end
end
