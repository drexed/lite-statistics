# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Statistics::Configuration do
  after do
    Lite::Statistics.configure do |config|
      config.monkey_patches = true
    end
  end

  describe '#configure' do
    it 'to be "foo"' do
      Lite::Statistics.configuration.monkey_patches = 'foo'

      expect(Lite::Statistics.configuration.monkey_patches).to eq('foo')
    end
  end

end
