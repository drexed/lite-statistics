# frozen_string_literal: true

module Lite
  module Statistics

    class Configuration

      attr_accessor :monkey_patches

      def initialize
        @monkey_patches = true
      end

    end

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configuration=(config)
      @configuration = config
    end

    def self.configure
      yield(configuration)
    end

  end
end
