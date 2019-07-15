# frozen_string_literal: true

module Enumerable

  # Make this work
  [
    :frequency,
    :mean,
    :median,
    :mode,
    :percentile_from_value,
    :population_coefficient_of_variation,
    :population_kurtosis,
    :population_skewness,
    :population_standard_deviation,
    :population_standard_error,
    :population_variance,
    :population_zscore,
    :range,
    :sample_coefficient_of_variation,
    :sample_kurtosis,
    :sample_skewness,
    :sample_standard_deviation,
    :sample_standard_error,
    :sample_variance,
    :sample_zscore,
    :value_from_percentile
  ].each do |name|
    define_method(name) { |*args| Lite::Statistics::Descriptive.send(name, self, *args) }
  end

  # TODO: try and move this into a helper file
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
