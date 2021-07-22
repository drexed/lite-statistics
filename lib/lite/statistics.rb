# frozen_string_literal: true

require 'generators/lite/statistics/install_generator' if defined?(Rails::Generators)

require 'lite/memoize'

%w[version configuration descriptive enumerable].each do |filename|
  require "lite/statistics/#{filename}"
end
