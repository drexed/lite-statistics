# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Statistics::SampleStandardDeviation do
  let(:collection) { [1, 1, 2, 3, 10] }
  let(:klass) { described_class.new(collection) }
  let(:n1) { 3.7815340802378072 }

  describe '#calculate' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.calculate).to eq(nil)
    end

    it 'to be 3.7815340802378072' do
      expect(klass.calculate).to eq(n1)
    end
  end

  describe '#monkey_patch' do
    it 'to be 3.7815340802378072 for sample_standard_deviation' do
      expect(collection.sample_standard_deviation).to eq(n1)
    end

    it 'to be 3.7815340802378072 for standard_deviation' do
      expect(collection.standard_deviation).to eq(n1)
    end
  end

end
