# frozen_string_literal: true

module Lite
  module Statistics
    class Base

      attr_accessor :collection

      def initialize(collection)
        @collection = collection
      end

      class << self

        def calculate(collection)
          klass = new(collection)
          klass.calculate
        end

      end

    end
  end
end
