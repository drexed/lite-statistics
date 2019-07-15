# frozen_string_literal: true

%w[version configuration base descriptive].each do |filename|
  require "lite/statistics/#{filename}"
end

require 'lite/statistics/enumerable' if Lite::Statistics.configuration.monkey_patches

require 'generators/lite/statistics/install_generator'
