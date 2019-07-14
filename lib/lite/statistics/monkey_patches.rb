# frozen_string_literal: true

module Enumerable

  {
    coefficient_of_variation: Lite::Statistics::CoefficientOfVariation,
    frequency: Lite::Statistics::Frequency,
    kurtosis: Lite::Statistics::Kurtosis,
    mean: Lite::Statistics::Mean,
    median: Lite::Statistics::Median,
    mode: Lite::Statistics::Mode,
    percentile_from_value: Lite::Statistics::PercentileFromValue,
    population_standard_deviation: Lite::Statistics::PopulationStandardDeviation,
    population_variance: Lite::Statistics::PopulationVariance,
    range: Lite::Statistics::Range,
    sample_variance: Lite::Statistics::SampleVariance,
    sample_standard_deviation: Lite::Statistics::SampleStandardDeviation,
    skewness: Lite::Statistics::Skewness,
    value_from_percentile: Lite::Statistics::ValueFromPercentile,
    zscore: Lite::Statistics::Zscore
  }.each do |name, klass|
    define_method(name) { |*args| klass.calculate(self, *args) }
  end

  alias average mean
  alias percentile percentile_from_value
  alias percentile_rank value_from_percentile
  alias standard_deviation sample_standard_deviation
  alias variance sample_variance

end
