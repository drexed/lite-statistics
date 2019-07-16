# frozen_string_literal: true

%w[lib benchmarks].each { |name| $LOAD_PATH.unshift(name) }

require 'benchmark/ips'
require 'descriptive_statistics/safe'

collection = []
1_000_000.times { collection << rand(1..99) }

# NOTE: Baseline and Default summaries are the same in this library

puts '~~~ Baseline/Default Summary Calculations ~~~'
puts

Benchmark.ips do |x|
  x.report('DS => 13 calcs') do
    data = DescriptiveStatistics::Stats.new(collection)
    data.descriptive_statistics
  end

  x.compare!
end
