# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Statistics::PercentileFromValue do
  let(:collection) { [1, 1, 2, 3, 10] }
  let(:klass) { described_class.new(collection) }
  let(:n1) { 10 }
  let(:n2) { 80 }

  describe '#calculate' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.calculate(n1)).to eq(nil)
    end

    it 'to be 80' do
      expect(klass.calculate(n1)).to eq(n2)
    end
  end

  describe '#monkey_patch' do
    it 'to be 80 percentile_from_value' do
      expect(collection.percentile_from_value(n1)).to eq(n2)
    end

    it 'to be 80 percentile' do
      expect(collection.percentile(n1)).to eq(n2)
    end
  end

end
