# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Statistics::ValueFromPercentile do
  let(:collection) { [1, 1, 2, 3, 10] }
  let(:klass) { described_class.new(collection) }
  let(:n1) { 60 }
  let(:n2) { 3 }

  describe '#calculate' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.calculate(n1)).to eq(nil)
    end

    it 'to be 3' do
      expect(klass.calculate(n1)).to eq(n2)
    end
  end

  describe '#monkey_patch' do
    it 'to be 3 for value_from_percentile' do
      expect(collection.value_from_percentile(n1)).to eq(n2)
    end

    it 'to be 3 for percentile_rank' do
      expect(collection.percentile_rank(n1)).to eq(n2)
    end
  end

end
