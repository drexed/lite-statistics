# frozen_string_literal: true

%w[lib benchmarks].each { |name| $LOAD_PATH.unshift(name) }

require 'benchmark/ips'
require 'lite/statistics'
require 'descriptive_statistics/safe'

collection = []
1_000_000.times { collection << rand(1..99) }

puts '~~~ Default Summary Size Calculations ~~~'
Benchmark.ips do |x|
  x.report('lite-statistics') do
    data = Lite::Statistics::Descriptive.new(collection)
    data.sample_summary
  end

  x.report('descriptive_statistics') do
    data = DescriptiveStatistics::Stats.new(collection)
    data.descriptive_statistics
  end

  x.compare!
end

def equal_summary(data)
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
    sample_standard_deviation: data.sample_standard_deviation,
    sample_variance: data.sample_variance,
  }
end

puts '~~~ Equal Summary Size Calculations ~~~'
Benchmark.ips do |x|
  x.report('lite-statistics') do
    data = Lite::Statistics::Descriptive.new(collection)
    equal_summary(data)
  end

  x.report('descriptive_statistics') do
    data = DescriptiveStatistics::Stats.new(collection)
    data.descriptive_statistics
  end

  x.compare!
end
