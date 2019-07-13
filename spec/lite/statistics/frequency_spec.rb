# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Statistics::Frequency do
  let(:collection) { [1, 1, 2, 3, 10] }
  let(:klass) { described_class.new(collection) }
  let(:h1) do
    {
      1 => 2,
      2 => 1,
      3 => 1,
      10 => 1
    }
  end

  describe '#calculate' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.calculate).to eq(nil)
    end

    it 'to be { ... }' do
      expect(klass.calculate).to eq(h1)
    end
  end

  describe '#monkey_patch' do
    it 'to be { ... }' do
      expect(collection.frequency).to eq(h1)
    end
  end

end
