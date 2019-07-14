# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Statistics::PopulationZscore do
  let(:collection) { [1, 1, 2, 3, 10] }
  let(:klass) { described_class.new(collection) }
  let(:a1) do
    [
      -0.7095748751868991,
      -0.7095748751868991,
      -0.4139186771923578,
      -0.11826247919781649,
      1.9513309067639724
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
      expect(collection.population_zscore).to eq(a1)
    end
  end

end
