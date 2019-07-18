# frozen_string_literal: true

%w[lib benchmarks].each { |name| $LOAD_PATH.unshift(name) }

require 'benchmark/ips'
require 'lite/statistics'

# rubocop:disable Metrics/MethodLength
def ls_baseline_summary(data)
  {
    max: data.max,
    mean: data.mean,
    median: data.median,
    min: data.min,
    mode: data.mode,
    quartile_1: data.value_from_percentile(25),
    quartile_2: data.value_from_percentile(50),
    quartile_3: data.value_from_percentile(75),
    range: data.range,
    size: data.size,
    sum: data.sum,
    standard_deviation: data.sample_standard_deviation,
    variance: data.sample_variance
  }
end
# rubocop:enable Metrics/MethodLength
