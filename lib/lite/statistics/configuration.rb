# frozen_string_literal: true

module Lite
  module Statistics

    class Configuration

      attr_accessor :monkey_patches

      def initialize
        @monkey_patches = true
      end

    end

    class << self

      attr_writer :configuration

      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield(configuration)
      end

      def reset_configuration!
        @configuration = Configuration.new
      end

    end

  end
end
