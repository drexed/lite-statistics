# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Statistics::PopulationSkewness do
  let(:collection) { [1, 1, 2, 3, 10] }
  let(:klass) { described_class.new(collection) }
  let(:n1) { 1.66074014712668 }

  describe '#calculate' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.calculate).to eq(nil)
    end

    it 'to be 1.66074014712668' do
      expect(klass.calculate).to eq(n1)
    end
  end

  describe '#monkey_patch' do
    it 'to be 1.66074014712668' do
      expect(collection.population_skewness).to eq(n1)
    end
  end

end
