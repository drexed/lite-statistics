# frozen_string_literal: true

%w[lib benchmarks].each { |name| $LOAD_PATH.unshift(name) }

require 'benchmark/ips'
require 'lite/statistics'
require 'descriptive_statistics/safe'

collection = []
1_000_000.times { collection << rand(1..99) }

# NOTE: Approx. 2.14x faster
# LS executes an additional 9 calculations

puts '~~~ Default Summary Size Calculations ~~~'
puts
Benchmark.ips do |x|
  x.report('LS => 22 calcs)') do
    data = Lite::Statistics::Descriptive.new(collection)
    data.sample_summary
  end

  x.report('DS => 13 calcs') do
    data = DescriptiveStatistics::Stats.new(collection)
    data.descriptive_statistics
  end

  x.compare!
end

# rubocop:disable Metrics/MethodLength
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
    sample_variance: data.sample_variance
  }
end
# rubocop:enable Metrics/MethodLength

# NOTE: Approx. 5.25x faster
# Executes same exact caculations for both libraries

puts '~~~ Equal Summary Size Calculations ~~~'
puts
Benchmark.ips do |x|
  x.report('LS => 13 calcs') do
    data = Lite::Statistics::Descriptive.new(collection)
    equal_summary(data)
  end

  x.report('DS => 13 calcs') do
    data = DescriptiveStatistics::Stats.new(collection)
    data.descriptive_statistics
  end

  x.compare!
end
