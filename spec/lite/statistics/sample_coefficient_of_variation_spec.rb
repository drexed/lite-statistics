# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Statistics::SampleCoefficientOfVariation do
  let(:collection) { [1, 1, 2, 3, 10] }
  let(:klass) { described_class.new(collection) }
  let(:n1) { 1.1122159059522962 }

  describe '#calculate' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.calculate).to eq(nil)
    end

    it 'to be 1.1122159059522962' do
      expect(klass.calculate).to eq(n1)
    end
  end

  describe '#monkey_patch' do
    it 'to be 1.1122159059522962 for sample_coefficient_of_variation' do
      expect(collection.sample_coefficient_of_variation).to eq(n1)
    end

    it 'to be 1.1122159059522962 for coefficient_of_variation' do
      expect(collection.coefficient_of_variation).to eq(n1)
    end
  end

end
