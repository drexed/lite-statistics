# frozen_string_literal: true

require 'descriptive-statistics'
require_relative 'base'

collection = []
1_000_000.times { collection << rand(1..99) }

puts '~~~ Baseline Summary Calculations ~~~'
puts

# rubocop:disable Metrics/MethodLength
def baseline_summary(data)
  {
    max: data.max,
    mean: data.mean,
    median: data.median,
    min: data.min,
    mode: data.mode,
    quartile1: data.value_from_percentile(25),
    quartile2: data.value_from_percentile(50),
    quartile3: data.value_from_percentile(75),
    range: data.range,
    size: data.size,
    sum: data.sum,
    standard_deviation: data.standard_deviation,
    variance: data.variance
  }
end
# rubocop:enable Metrics/MethodLength

Benchmark.ips do |x|
  x.report('LS.13') do
    data = Lite::Statistics::Descriptive.new(collection)
    ls_baseline_summary(data)
  end

  x.report('DS.13') do
    data = DescriptiveStatistics::Stats.new(collection)
    baseline_summary(data)
  end

  x.compare!
end

puts '~~~ Full Summary Calculations ~~~'
puts

def full_summary(data)
  baseline_summary(data).merge(
    relative_standard_deviation: data.relative_standard_deviation,
    skewness: data.skewness,
    kurtosis: data.kurtosis
  )
end

Benchmark.ips do |x|
  x.report('LS.22') do
    data = Lite::Statistics::Descriptive.new(collection)
    data.sample_summary
  end

  x.report('DS.16') do
    data = DescriptiveStatistics::Stats.new(collection)
    full_summary(data)
  end

  x.compare!
end
