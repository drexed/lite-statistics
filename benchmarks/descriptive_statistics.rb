# frozen_string_literal: true

require 'descriptive_statistics/safe'
require_relative 'base'

collection = []
1_000_000.times { collection << rand(1..99) }

puts '~~~ Baseline Summary Calculations ~~~'
puts
Benchmark.ips do |x|
  x.report('LS.13') do
    data = Lite::Statistics::Descriptive.new(collection)
    ls_baseline_summary(data)
  end

  x.report('DS.13') do
    data = DescriptiveStatistics::Stats.new(collection)
    data.descriptive_statistics
  end

  x.compare!
end

puts '~~~ Full Summary Calculations ~~~'
puts
Benchmark.ips do |x|
  x.report('LS.22') do
    data = Lite::Statistics::Descriptive.new(collection)
    data.sample_summary
  end

  x.report('DS.13') do
    data = DescriptiveStatistics::Stats.new(collection)
    data.descriptive_statistics
  end

  x.compare!
end
