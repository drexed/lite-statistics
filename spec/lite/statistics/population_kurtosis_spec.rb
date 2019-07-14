# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Statistics::PopulationKurtosis do
  let(:collection) { [1, 1, 2, 3, 10] }
  let(:klass) { described_class.new(collection) }
  let(:n1) { 3.75877182258301 }

  describe '#calculate' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.calculate).to eq(nil)
    end

    it 'to be 3.75877182258301' do
      expect(klass.calculate).to eq(n1)
    end
  end

  describe '#monkey_patch' do
    it 'to be 3.75877182258301' do
      expect(collection.population_kurtosis).to eq(n1)
    end
  end

end
