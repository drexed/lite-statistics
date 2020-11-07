# frozen_string_literal: true

require 'statistica'
require_relative 'base'

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
    quartile1: data.get_percentile(25),
    quartile2: data.get_percentile(50),
    quartile3: data.get_percentile(75),
    range: data.get_range,
    size: data.size,
    sum: data.get_sum,
    standard_deviation: data.get_stdev,
    variance: data.get_variance
  }
end
# rubocop:enable Metrics/MethodLength

Benchmark.ips do |x|
  x.report('LS.13') do
    data = Lite::Statistics::Descriptive.new(collection)
    ls_baseline_summary(data)
  end

  x.report('ST.13') do
    baseline_summary(collection)
  end

  x.compare!
end

puts '~~~ Full Summary Calculations ~~~'
puts

def full_summary(data)
  baseline_summary(data).merge(
    geometric_mean: data.get_geo_mean,
    harmonic_mean: data.get_harm_mean,
    product: data.get_product,
    interquartilerange: data.get_interquartilerange,
    relative_variance: data.get_relative_variance,
    coeff_variation: data.get_coeff_variation
  )
end

Benchmark.ips do |x|
  x.report('LS.22') do
    data = Lite::Statistics::Descriptive.new(collection)
    data.sample_summary
  end

  x.report('ST.19') do
    full_summary(collection)
  end

  x.compare!
end
