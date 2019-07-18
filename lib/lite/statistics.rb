# frozen_string_literal: true

require 'lite/memoize'

%w[version configuration descriptive].each do |filename|
  require "lite/statistics/#{filename}"
end

require 'lite/statistics/enumerable' if Lite::Statistics.configuration.monkey_patches

require 'generators/lite/statistics/install_generator'
