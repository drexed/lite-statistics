# frozen_string_literal: true

module Enumerable

  {
    frequency: Lite::Statistics::Frequency,
    mean: Lite::Statistics::Mean,
    median: Lite::Statistics::Median,
    mode: Lite::Statistics::Mode,
    percentile_from_value: Lite::Statistics::PercentileFromValue,
    population_coefficient_of_variation: Lite::Statistics::PopulationCoefficientOfVariation,
    population_kurtosis: Lite::Statistics::PopulationKurtosis,
    population_skewness: Lite::Statistics::PopulationSkewness,
    population_standard_deviation: Lite::Statistics::PopulationStandardDeviation,
    population_standard_error: Lite::Statistics::PopulationStandardError,
    population_variance: Lite::Statistics::PopulationVariance,
    population_zscore: Lite::Statistics::PopulationZscore,
    range: Lite::Statistics::Range,
    sample_coefficient_of_variation: Lite::Statistics::SampleCoefficientOfVariation,
    sample_kurtosis: Lite::Statistics::SampleKurtosis,
    sample_skewness: Lite::Statistics::SampleSkewness,
    sample_standard_deviation: Lite::Statistics::SampleStandardDeviation,
    sample_standard_error: Lite::Statistics::SampleStandardError,
    sample_variance: Lite::Statistics::SampleVariance,
    sample_zscore: Lite::Statistics::SampleZscore,
    value_from_percentile: Lite::Statistics::ValueFromPercentile
  }.each do |name, klass|
    define_method(name) { |*args| klass.calculate(self, *args) }
  end

  alias average mean
  alias coefficient_of_variation sample_coefficient_of_variation
  alias kurtosis sample_kurtosis
  alias percentile percentile_from_value
  alias percentile_rank value_from_percentile
  alias skewness sample_skewness
  alias standard_deviation sample_standard_deviation
  alias standard_error sample_standard_error
  alias variance sample_variance
  alias zscore sample_zscore

end
