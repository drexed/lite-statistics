# frozen_string_literal: true

module Lite
  module Statistics
    class Descriptive < Lite::Statistics::Base

      CALCULATIONS ||= %i[
        frequencies max mean median midrange min mode proportions percentile_from_value
        population_coefficient_of_variation population_kurtosis population_size population_skewness
        population_standard_deviation population_standard_error population_summary
        population_variance population_zscore range sample_coefficient_of_variation sample_kurtosis
        sample_size sample_skewness sample_standard_deviation sample_standard_error sample_summary
        sample_variance sample_zscore sum value_from_percentile
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

      alias average mean

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
        memoize("percentile_from_value_#{value}".to_sym) do
          return if @collection.empty?

          (sort.index(value) / size.to_f * 100).ceil
        end
      end

      alias percentile percentile_from_value

      def population_coefficient_of_variation
        memoize(:population_coefficient_of_variation) do
          return if @collection.empty?

          population_standard_deviation / mean
        end
      end

      def population_size
        memoize(:population_size) do
          @collection.size - 1
        end
      end

      def population_kurtosis
        memoize(:population_kurtosis) do
          return if @collection.empty?
          return 0 if size == 1

          quarted_standard_deviation = population_standard_deviation**4
          sum_of_power(4) / (population_size * quarted_standard_deviation.to_f)
        end
      end

      def population_skewness
        memoize(:population_skewness) do
          return if @collection.empty?
          return 0 if size == 1

          cubed_standard_deviation = population_standard_deviation**3
          sum_of_power(3) / (population_size * cubed_standard_deviation.to_f)
        end
      end

      def population_standard_deviation
        memoize(:population_standard_deviation) do
          return if @collection.empty?

          Math.sqrt(population_variance)
        end
      end

      def population_standard_error
        memoize(:population_standard_error) do
          return if @collection.empty?

          population_standard_deviation / Math.sqrt(population_size)
        end
      end

      def population_summary
        base_summary.merge(
          population_coefficient_of_variation: population_coefficient_of_variation,
          population_kurtosis: population_kurtosis,
          population_size: population_size,
          population_skewness: population_skewness,
          population_standard_deviation: population_standard_deviation,
          population_standard_error: population_standard_error,
          population_variance: population_variance,
          population_zscore: population_zscore
        )
      end

      def population_variance
        memoize(:population_variance) do
          return if @collection.empty?

          sum_of_power(2) / population_size.to_f
        end
      end

      def population_zscore
        memoize(:population_zscore) do
          return if size < 2
          return Hash.new(0) if population_standard_deviation.zero?

          @collection.each_with_object({}) do |val, hash|
            hash[val] ||= (val - mean) / population_standard_deviation
          end
        end
      end

      def midrange
        memoize(:midrange) do
          return if @collection.empty?

          [min, max].sum / 2.0
        end
      end

      alias midextreme midrange

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

      def sample_coefficient_of_variation
        memoize(:sample_coefficient_of_variation) do
          return if @collection.empty?

          sample_standard_deviation / mean
        end
      end

      alias coefficient_of_variation sample_coefficient_of_variation

      def sample_size
        memoize(:sample_size) do
          @collection.size
        end
      end

      alias size sample_size

      def sample_kurtosis
        memoize(:sample_kurtosis) do
          return if @collection.empty?
          return 0 if size == 1

          quarted_standard_deviation = sample_standard_deviation**4
          sum_of_power(4) / (sample_size * quarted_standard_deviation.to_f)
        end
      end

      alias kurtosis sample_kurtosis

      def sample_skewness
        memoize(:sample_skewness) do
          return if @collection.empty?
          return 0 if size == 1

          cubed_standard_deviation = sample_standard_deviation**3
          sum_of_power(3) / (sample_size * cubed_standard_deviation.to_f)
        end
      end

      alias skewness sample_skewness

      def sample_standard_deviation
        memoize(:sample_standard_deviation) do
          return if @collection.empty?

          Math.sqrt(sample_variance)
        end
      end

      alias standard_deviation sample_standard_deviation

      def sample_standard_error
        memoize(:sample_standard_error) do
          return if @collection.empty?

          sample_standard_deviation / Math.sqrt(sample_size)
        end
      end

      alias standard_error sample_standard_error

      def sample_summary
        base_summary.merge(
          sample_coefficient_of_variation: sample_coefficient_of_variation,
          sample_kurtosis: sample_kurtosis,
          sample_size: sample_size,
          sample_skewness: sample_skewness,
          sample_standard_deviation: sample_standard_deviation,
          sample_standard_error: sample_standard_error,
          sample_variance: sample_variance,
          sample_zscore: sample_zscore
        )
      end

      alias summary sample_summary

      def sample_variance
        memoize(:sample_variance) do
          return if @collection.empty?

          sum_of_power(2) / sample_size.to_f
        end
      end

      alias variance sample_variance

      def sample_zscore
        memoize(:sample_zscore) do
          return if size < 2
          return Hash.new(0) if sample_standard_deviation.zero?

          @collection.each_with_object({}) do |val, hash|
            hash[val] ||= (val - mean) / sample_standard_deviation
          end
        end
      end

      alias zscore sample_zscore

      def sum
        memoize(:sum) do
          @collection.sum
        end
      end

      def value_from_percentile(percentile)
        memoize("value_from_percentile_#{percentile}".to_sym) do
          return if @collection.empty?

          index = (percentile.to_f / 100 * size).ceil
          sort[index]
        end
      end

      alias percentile_rank value_from_percentile

      private

      # rubocop:disable Metrics/MethodLength
      def base_summary
        {
          frequencies: frequencies,
          max: max,
          mean: mean,
          median: median,
          midrange: midrange,
          min: min,
          mode: mode,
          proportions: proportions,
          quartile_1: value_from_percentile(25),
          quartile_2: value_from_percentile(50),
          quartile_3: value_from_percentile(75),
          range: range,
          size: size,
          sum: sum
        }
      end
      # rubocop:enable Metrics/MethodLength

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
