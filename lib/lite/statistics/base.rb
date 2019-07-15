# frozen_string_literal: true

module Lite
  module Statistics
    class Base

      private

      def cache
        @cache ||= {}
      end

      def memoize(key, &block)
        return cache[key] if cache.key?(key)

        cache[key] ||= yield(block)
      end

    end
  end
end
