# frozen_string_literal: true

module Lite
  module Statistics
    class Descriptive

      extend Lite::Memoize::Alias

      CALCULATIONS ||= %i[
        frequencies max mean median midrange min mode proportions percentile_from_value
        population_coefficient_of_variation population_kurtosis population_size population_skewness
        population_standard_deviation population_standard_error population_summary
        population_variance population_zscores range sample_coefficient_of_variation sample_kurtosis
        sample_size sample_skewness sample_standard_deviation sample_standard_error sample_summary
        sample_variance sample_zscores sum value_from_percentile
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
        return if @collection.empty?

        @collection.each_with_object(Hash.new(0)) { |val, hash| hash[val] += 1 }
      end

      memoize :frequencies

      # rubocop:disable Style/UnneededSort
      def max
        return if @collection.empty?

        sort.last
      end

      memoize :max
      # rubocop:enable Style/UnneededSort

      def mean
        return if @collection.empty?

        sum / size.to_f
      end

      memoize :mean
      alias average mean

      # rubocop:disable Metrics/AbcSize
      def median
        return if @collection.empty?
        return sort[size / 2] unless size.even?

        (sort[(size / 2) - 1] + sort[size / 2]) / 2.0
      end

      memoize :median
      # rubocop:enable Metrics/AbcSize

      # rubocop:disable Style/UnneededSort
      def min
        return if @collection.empty?

        sort.first
      end

      memoize :min
      # rubocop:enable Style/UnneededSort

      def mode
        return if @collection.empty?

        top_two = frequencies.sort_by { |_, val| -val }.take(2)
        return if top_two.first.last == top_two.last.last

        top_two.first.first
      end

      memoize :mode

      def percentile_from_value(value)
        return if @collection.empty?

        (sort.index(value) / size.to_f * 100).ceil
      end

      memoize :percentile_from_value
      alias percentile percentile_from_value

      def population_coefficient_of_variation
        return if @collection.empty?

        population_standard_deviation / mean
      end

      memoize :population_coefficient_of_variation

      def population_size
        @collection.size - 1
      end

      memoize :population_size

      def population_kurtosis
        return if @collection.empty?
        return 0 if size == 1

        quarted_standard_deviation = population_standard_deviation**4
        sum_of_power(4) / (population_size * quarted_standard_deviation.to_f)
      end

      memoize :population_kurtosis

      def population_skewness
        return if @collection.empty?
        return 0 if size == 1

        cubed_standard_deviation = population_standard_deviation**3
        sum_of_power(3) / (population_size * cubed_standard_deviation.to_f)
      end

      memoize :population_skewness

      def population_standard_deviation
        return if @collection.empty?

        Math.sqrt(population_variance)
      end

      memoize :population_standard_deviation

      def population_standard_error
        return if @collection.empty?

        population_standard_deviation / Math.sqrt(population_size)
      end

      memoize :population_standard_error

      def population_summary
        base_summary.merge(
          population_coefficient_of_variation: population_coefficient_of_variation,
          population_kurtosis: population_kurtosis,
          population_size: population_size,
          population_skewness: population_skewness,
          population_standard_deviation: population_standard_deviation,
          population_standard_error: population_standard_error,
          population_variance: population_variance,
          population_zscores: population_zscores
        )
      end

      def population_variance
        return if @collection.empty?

        sum_of_power(2) / population_size.to_f
      end

      memoize :population_variance

      def population_zscores
        return if size < 2
        return Hash.new(0) if population_standard_deviation.zero?

        @collection.each_with_object({}) do |val, hash|
          hash[val] ||= (val - mean) / population_standard_deviation
        end
      end

      memoize :population_zscores

      def midrange
        return if @collection.empty?

        [min, max].sum / 2.0
      end

      memoize :midrange
      alias midextreme midrange

      def proportions
        return if @collection.empty?

        frequencies.each_with_object({}) { |(key, val), hash| hash[key] = val / size.to_f }
      end

      memoize :proportions

      def range
        return if @collection.empty?

        max - min
      end

      memoize :range

      def sample_coefficient_of_variation
        return if @collection.empty?

        sample_standard_deviation / mean
      end

      memoize :sample_coefficient_of_variation
      alias coefficient_of_variation sample_coefficient_of_variation

      def sample_size
        @collection.size
      end

      memoize :sample_size
      alias size sample_size

      def sample_kurtosis
        return if @collection.empty?
        return 0 if size == 1

        quarted_standard_deviation = sample_standard_deviation**4
        sum_of_power(4) / (sample_size * quarted_standard_deviation.to_f)
      end

      memoize :sample_kurtosis
      alias kurtosis sample_kurtosis

      def sample_skewness
        return if @collection.empty?
        return 0 if size == 1

        cubed_standard_deviation = sample_standard_deviation**3
        sum_of_power(3) / (sample_size * cubed_standard_deviation.to_f)
      end

      memoize :sample_skewness
      alias skewness sample_skewness

      def sample_standard_deviation
        return if @collection.empty?

        Math.sqrt(sample_variance)
      end

      memoize :sample_standard_deviation
      alias standard_deviation sample_standard_deviation

      def sample_standard_error
        return if @collection.empty?

        sample_standard_deviation / Math.sqrt(sample_size)
      end

      memoize :sample_standard_error
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
          sample_zscores: sample_zscores
        )
      end

      alias summary sample_summary

      def sample_variance
        return if @collection.empty?

        sum_of_power(2) / sample_size.to_f
      end

      memoize :sample_variance
      alias variance sample_variance

      def sample_zscores
        return if size < 2
        return Hash.new(0) if sample_standard_deviation.zero?

        @collection.each_with_object({}) do |val, hash|
          hash[val] ||= (val - mean) / sample_standard_deviation
        end
      end

      memoize :sample_zscores
      alias zscores sample_zscores

      def sum
        @collection.sum
      end

      memoize :sum

      def value_from_percentile(percentile)
        return if @collection.empty?

        index = (percentile.to_f / 100 * size).ceil
        sort[index]
      end

      memoize :value_from_percentile
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
        @collection.sort
      end

      memoize :sort

      def sum_of_power(power)
        @collection.inject(0) { |acc, val| acc + (val - mean)**power }
      end

    end
  end
end
