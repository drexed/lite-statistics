# frozen_string_literal: true

module Enumerable

  {
    mean: Lite::Statistics::Mean,
    median: Lite::Statistics::Median,
    mode: Lite::Statistics::Mode,
    range: Lite::Statistics::Range,
    percentile_from_value: Lite::Statistics::PercentileFromValue,
    value_from_percentile: Lite::Statistics::ValueFromPercentile,
    variance: Lite::Statistics::Variance,
    population_variance: Lite::Statistics::PopulationVariance,
    standard_deviation: Lite::Statistics::StandardDeviation,
    relative_standard_deviation: Lite::Statistics::RelativeStandardDeviation,
    population_standard_deviation: Lite::Statistics::PopulationStandardDeviation,
    zscore: Lite::Statistics::Zscore
  }.each do |name, klass|
    define_method(name) { |*args| klass.calculate(self, *args) }
  end

  alias average mean

end
