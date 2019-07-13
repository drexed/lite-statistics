# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Statistics::Zscore do
  let(:collection) { [1, 1, 2, 3, 10] }
  let(:klass) { described_class.new(collection) }
  let(:a1) do
    [
      -0.6346630624175341,
      -0.6346630624175341,
      -0.37022011974356156,
      -0.105777177069589,
      1.7453234216482187
    ]
  end

  describe '#calculate' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.calculate).to eq(nil)
    end

    it 'to be [ ... ]' do
      expect(klass.calculate).to eq(a1)
    end
  end

  describe '#monkey_patch' do
    it 'to be [ ... ]' do
      expect(collection.zscore).to eq(a1)
    end
  end

end
