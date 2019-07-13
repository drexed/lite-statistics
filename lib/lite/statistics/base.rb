# frozen_string_literal: true

module Lite
  module Statistics
    class Base

      attr_accessor :collection

      def initialize(collection)
        @collection = collection
      end

      class << self

        def calculate(collection, *args)
          klass = new(collection)
          klass.calculate(*args)
        end

      end

    end
  end
end
