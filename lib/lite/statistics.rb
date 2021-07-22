# frozen_string_literal: true

require 'generators/lite/statistics/install_generator' if defined?(Rails::Generators)

require 'lite/memoize' unless defined?(Lite::Memoize)

require 'lite/statistics/version'
require 'lite/statistics/descriptive'
