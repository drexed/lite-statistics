# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Statistics::Mean do
  let(:collection) { [1, 2, 3] }
  let(:klass) { described_class.new(collection) }
  let(:n1) { 2.0 }

  describe '#calculate' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.calculate).to eq(nil)
    end

    it 'to be 2.0' do
      expect(klass.calculate).to eq(n1)
    end
  end

  describe '#monkey_patch' do
    it 'to be 2.0 when mean' do
      expect(collection.mean).to eq(n1)
    end

    it 'to be 2.0 when average' do
      expect(collection.average).to eq(n1)
    end
  end

end
