# frozen_string_literal: true

require 'lite/memoize'

%w[version configuration descriptive enumerable].each do |filename|
  require "lite/statistics/#{filename}"
end

require 'generators/lite/statistics/install_generator'
