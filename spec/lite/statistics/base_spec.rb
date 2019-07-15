# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Statistics::Base do
  let(:klass) { described_class.new }

  describe '#cache' do
    it 'to be {}' do
      expect(klass.send(:cache)).to eq({})
    end
  end

  describe '#memoize' do
    it 'to be {}' do
      random_one = rand(1..1_000_000)
      klass.send(:memoize, :test) { random_one }
      klass.send(:memoize, :test) { rand(1..1_000_000) }
      cache = klass.send(:cache)

      expect(cache[:test]).to eq(random_one)
    end
  end

end
