# frozen_string_literal: true

%w[
  version configuration base frequency mean median mode range percentile_from_value
  value_from_percentile sample_variance sample_standard_deviation sample_standard_error
  sample_coefficient_of_variation sample_zscore sample_skewness sample_kurtosis population_variance
  population_standard_deviation population_standard_error population_coefficient_of_variation
  population_zscore population_skewness population_kurtosis
].each do |filename|
  require "lite/statistics/#{filename}"
end

require 'lite/statistics/monkey_patches' if Lite::Statistics.configuration.monkey_patches

require 'generators/lite/statistics/install_generator'
