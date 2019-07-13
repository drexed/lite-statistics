# frozen_string_literal: true

%w[version configuration base mean median mode].each do |filename|
  require "lite/statistics/#{filename}"
end

require 'lite/statistics/monkey_patches' if Lite::Statistics.configuration.monkey_patches

require 'generators/lite/statistics/install_generator'
