# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Statistics::Mode do
  let(:collection) { [1, 2, 3, 1] }
  let(:klass) { described_class.new(collection) }
  let(:n1) { 1 }

  describe '#calculate' do
    it 'to be nil when empty' do
      klass = described_class.new([])

      expect(klass.calculate).to eq(nil)
    end

    it 'to be nil when equal frequency' do
      klass = described_class.new([1, 2, 3])

      expect(klass.calculate).to eq(nil)
    end

    it 'to be 1' do
      expect(klass.calculate).to eq(n1)
    end
  end

  describe '#monkey_patch' do
    it 'to be 1' do
      expect(collection.mode).to eq(n1)
    end
  end

end
