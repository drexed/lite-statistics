# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Statistics::Configuration do
  after { Lite::Statistics.reset_configuration! }

  describe '#configure' do
    it 'to be "foo"' do
      Lite::Statistics.configuration.monkey_patches = 'foo'

      expect(Lite::Statistics.configuration.monkey_patches).to eq('foo')
    end
  end

  describe '#reset_configuration!' do
    it 'to be true' do
      Lite::Statistics.configuration.monkey_patches = 'foo'
      Lite::Statistics.reset_configuration!

      expect(Lite::Statistics.configuration.monkey_patches).to eq(true)
    end
  end

end
