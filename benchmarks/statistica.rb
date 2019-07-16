# frozen_string_literal: true

%w[lib benchmarks].each { |name| $LOAD_PATH.unshift(name) }

require 'benchmark/ips'
require 'statistica'

collection = []
1_000_000.times { collection << rand(1..99) }

puts '~~~ Baseline Summary Calculations ~~~'
puts

# rubocop:disable Metrics/MethodLength
def baseline_summary(data)
  {
    max: data.max,
    mean: data.get_arith_mean,
    median: data.get_median,
    min: data.min,
    mode: data.get_mode,
    quartile_1: data.get_percentile(25),
    quartile_2: data.get_percentile(50),
    quartile_3: data.get_percentile(75),
    range: data.get_range,
    size: data.size,
    sum: data.get_sum,
    standard_deviation: data.get_stdev,
    variance: data.get_variance
  }
end
# rubocop:enable Metrics/MethodLength

Benchmark.ips do |x|
  x.report('LS => 13 calcs') do
    baseline_summary(collection)
  end

  x.compare!
end

puts '~~~ Default Summary Calculations ~~~'
puts

def default_summary(data)
  baseline_summary(data).merge(
    geometric_mean: data.get_geo_mean,
    harmonic_mean: data.get_harm_mean,
    product: data.get_product,
    interquartile_range: data.get_interquartile_range,
    relative_variance: data.get_relative_variance,
    coeff_variation: data.get_coeff_variation
  )
end

Benchmark.ips do |x|
  x.report('LS => 19 calcs') do
    default_summary(collection)
  end

  x.compare!
end
