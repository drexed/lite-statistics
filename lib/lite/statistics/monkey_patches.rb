# frozen_string_literal: true

module Enumerable

  EXCLUDED_DESCRIPTIVE_CALCULATIONS = %i[max min sum].freeze

  Lite::Statistics::Descriptive::CALCULATIONS.each do |name|
    next if EXCLUDED_DESCRIPTIVE_CALCULATIONS.include?(name)

    define_method(name) { |*args| Lite::Statistics::Descriptive.send(name, self, *args) }
  end

  alias average mean
  alias coefficient_of_variation sample_coefficient_of_variation
  alias kurtosis sample_kurtosis
  alias midextreme midrange
  alias percentile percentile_from_value
  alias percentile_rank value_from_percentile
  alias skewness sample_skewness
  alias standard_deviation sample_standard_deviation
  alias standard_error sample_standard_error
  alias summary sample_summary
  alias variance sample_variance
  alias zscores sample_zscores

end
