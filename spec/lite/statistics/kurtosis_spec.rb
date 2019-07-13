# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Statistics::Kurtosis do
  let(:collection) { [1, 1, 2, 3, 10] }
  let(:klass) { described_class.new(collection) }
  let(:n1) { 2.405613966453127 }

  describe '#calculate' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.calculate).to eq(nil)
    end

    it 'to be 2.405613966453127' do
      expect(klass.calculate).to eq(n1)
    end
  end

  describe '#monkey_patch' do
    it 'to be 2.405613966453127' do
      expect(collection.kurtosis).to eq(n1)
    end
  end

end
