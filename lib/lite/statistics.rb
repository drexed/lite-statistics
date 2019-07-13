# frozen_string_literal: true

%w[
  version configuration base mean median mode range percentile_from_value value_from_percentile
  variance population_variance standard_deviation population_standard_deviation
  relative_standard_deviation zscore
].each do |filename|
  require "lite/statistics/#{filename}"
end

require 'lite/statistics/monkey_patches' if Lite::Statistics.configuration.monkey_patches

require 'generators/lite/statistics/install_generator'
