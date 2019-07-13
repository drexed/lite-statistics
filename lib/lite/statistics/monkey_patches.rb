# frozen_string_literal: true

module Enumerable

  {
    frequency: Lite::Statistics::Frequency,
    kurtosis: Lite::Statistics::Kurtosis,
    mean: Lite::Statistics::Mean,
    median: Lite::Statistics::Median,
    mode: Lite::Statistics::Mode,
    percentile_from_value: Lite::Statistics::PercentileFromValue,
    population_standard_deviation: Lite::Statistics::PopulationStandardDeviation,
    population_variance: Lite::Statistics::PopulationVariance,
    range: Lite::Statistics::Range,
    relative_standard_deviation: Lite::Statistics::RelativeStandardDeviation,
    skewness: Lite::Statistics::Skewness,
    standard_deviation: Lite::Statistics::StandardDeviation,
    value_from_percentile: Lite::Statistics::ValueFromPercentile,
    variance: Lite::Statistics::Variance,
    zscore: Lite::Statistics::Zscore
  }.each do |name, klass|
    define_method(name) { |*args| klass.calculate(self, *args) }
  end

  alias average mean

end
