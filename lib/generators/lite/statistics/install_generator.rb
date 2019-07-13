# frozen_string_literal: true

require 'rails/generators'

module Lite
  module Statistics
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)

      def copy_initializer_file
        copy_file('install.rb', 'config/initializers/lite-statistics.rb')
      end

    end
  end
end
