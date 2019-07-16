# frozen_string_literal: true

%w[lib benchmarks].each { |name| $LOAD_PATH.unshift(name) }

require 'benchmark/ips'
require 'descriptive-statistics'

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
    quartile_1: data.value_from_percentile(25),
    quartile_2: data.value_from_percentile(50),
    quartile_3: data.value_from_percentile(75),
    range: data.range,
    size: data.size,
    sum: data.sum,
    standard_deviation: data.standard_deviation,
    variance: data.variance
  }
end
# rubocop:enable Metrics/MethodLength

Benchmark.ips do |x|
  x.report('LS => 13 calcs') do
    data = DescriptiveStatistics::Stats.new(collection)
    baseline_summary(data)
  end

  x.compare!
end

puts '~~~ Default Summary Calculations ~~~'
puts

def default_summary(data)
  baseline_summary(data).merge(
    relative_standard_deviation: data.relative_standard_deviation,
    skewness: data.skewness,
    kurtosis: data.kurtosis
  )
end

Benchmark.ips do |x|
  x.report('LS => 15 calcs') do
    data = DescriptiveStatistics::Stats.new(collection)
    default_summary(data)
  end

  x.compare!
end
