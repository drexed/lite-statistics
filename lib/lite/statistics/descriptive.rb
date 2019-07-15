# frozen_string_literal: true

module Lite
  module Statistics
    class Descriptive < Lite::Statistics::Base

      CALCULATIONS ||= %i[
        frequencies max mean median min mode proportions percentile_from_value
        population_coefficient_of_variation population_kurtosis population_size population_skewness
        population_standard_deviation population_standard_error range population_variance
        population_zscore sample_coefficient_of_variation sample_kurtosis sample_size
        sample_skewness sample_standard_deviation sample_standard_error sample_variance
        sample_zscore sum value_from_percentile
      ].freeze

      def initialize(collection)
        @collection = collection
      end

      class << self

        CALCULATIONS.each do |name|
          define_method(name) do |collection, *args|
            klass = new(collection)
            klass.send(name, *args)
          end
        end

      end

      def frequencies
        memoize(:frequencies) do
          return if @collection.empty?

          @collection.each_with_object(Hash.new(0)) { |val, hash| hash[val] += 1 }
        end
      end

      # rubocop:disable Style/UnneededSort
      def max
        memoize(:max) do
          return if @collection.empty?

          sort.last
        end
      end
      # rubocop:enable Style/UnneededSort

      def mean
        memoize(:mean) do
          return if @collection.empty?

          sum / size.to_f
        end
      end

      # rubocop:disable Metrics/AbcSize
      def median
        memoize(:median) do
          return if @collection.empty?
          return sort[size / 2] unless size.even?

          (sort[(size / 2) - 1] + sort[size / 2]) / 2.0
        end
      end
      # rubocop:enable Metrics/AbcSize

      # rubocop:disable Style/UnneededSort
      def min
        memoize(:min) do
          return if @collection.empty?

          sort.first
        end
      end
      # rubocop:enable Style/UnneededSort

      def mode
        memoize(:mode) do
          return if @collection.empty?

          top_two = frequencies.sort_by { |_, val| -val }.take(2)
          return if top_two.first.last == top_two.last.last

          top_two.first.first
        end
      end

      def percentile_from_value(value)
        memoize(:percentile_from_value) do
          return if @collection.empty?

          (sort.index(value) / size.to_f * 100).ceil
        end
      end

      def population_size
        memoize(:population_size) do
          @collection.size - 1
        end
      end

      def product
        memoize(:product) do
          return 0 if @collection.empty?

          @collection.inject(1) { |acc, val| acc * val }
        end
      end

      def proportions
        memoize(:proportions) do
          return if @collection.empty?

          frequencies.each_with_object({}) { |(key, val), hash| hash[key] = val / size.to_f }
        end
      end

      def range
        memoize(:range) do
          return if @collection.empty?

          max - min
        end
      end

      def sample_size
        memoize(:sample_size) do
          @collection.size
        end
      end

      def sum
        memoize(:sum) do
          @collection.sum
        end
      end

      def value_from_percentile(percentile)
        memoize(:value_from_percentile) do
          return if @collection.empty?

          index = (percentile.to_f / 100 * size).ceil
          sort[index]
        end
      end

      %i[population sample].each do |type|
        name = "#{type}_coefficient_of_variation".to_sym
        define_method(name) do
          memoize(name) do
            return if @collection.empty?

            send("#{type}_standard_deviation") / mean
          end
        end

        name = "#{type}_kurtosis".to_sym
        define_method(name) do
          memoize(name) do
            return if @collection.empty?
            return 0 if size == 1

            quarted_standard_deviation = send("#{type}_standard_deviation")**4
            sum_of_power(4) / (send("#{type}_size") * quarted_standard_deviation.to_f)
          end
        end

        name = "#{type}_skewness".to_sym
        define_method(name) do
          memoize(name) do
            return if @collection.empty?
            return 0 if size == 1

            cubed_standard_deviation = send("#{type}_standard_deviation")**3
            sum_of_power(3) / (send("#{type}_size") * cubed_standard_deviation.to_f)
          end
        end

        name = "#{type}_standard_deviation".to_sym
        define_method(name) do
          memoize(name) do
            return if @collection.empty?

            Math.sqrt(send("#{type}_variance"))
          end
        end

        name = "#{type}_standard_error".to_sym
        define_method(name) do
          memoize(name) do
            return if @collection.empty?

            send("#{type}_standard_deviation") / Math.sqrt(send("#{type}_size"))
          end
        end

        name = "#{type}_variance".to_sym
        define_method(name) do
          memoize(name) do
            return if @collection.empty?

            sum_of_power(2) / send("#{type}_size").to_f
          end
        end

        name = "#{type}_zscore".to_sym
        define_method(name) do
          memoize(name) do
            return if size < 2
            return Array.new(size, 0) if send("#{type}_standard_deviation").zero?

            @collection.collect { |val| (val - mean) / send("#{type}_standard_deviation") }
          end
        end
      end

      alias average mean
      alias coefficient_of_variation sample_coefficient_of_variation
      alias kurtosis sample_kurtosis
      alias percentile percentile_from_value
      alias percentile_rank value_from_percentile
      alias skewness sample_skewness
      alias size sample_size
      alias standard_deviation sample_standard_deviation
      alias standard_error sample_standard_error
      alias variance sample_variance
      alias zscore sample_zscore

      private

      def sort
        memoize(:sort) do
          @collection.sort
        end
      end

      def sum_of_power(power)
        @collection.inject(0) { |acc, val| acc + (val - mean)**power }
      end

    end
  end
end
