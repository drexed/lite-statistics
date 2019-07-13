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
    skewness: Lite::Statistics::Skewness,
    standard_deviation: Lite::Statistics::StandardDeviation,
    value_from_percentile: Lite::Statistics::ValueFromPercentile,
    variance: Lite::Statistics::Variance,
    zscore: Lite::Statistics::Zscore
  }.each do |name, klass|
    define_method(name) { |*args| klass.calculate(self, *args) }
  end

  alias average mean
  alias percentile percentile_from_value
  alias percentile_rank value_from_percentile
  alias sample_standard_deviation standard_deviation
  alias sample_variance variance

end
