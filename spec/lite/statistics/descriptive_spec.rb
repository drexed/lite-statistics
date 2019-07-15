# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Statistics::Descriptive do
  let(:collection) { [1, 1, 2, 3, 10] }
  let(:klass) { described_class.new(collection) }

  describe '#frequencies' do
    let(:h1) do
      {
        1 => 2,
        2 => 1,
        3 => 1,
        10 => 1
      }
    end

    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.frequencies).to eq(nil)
    end

    it 'to be { ... }' do
      expect(klass.frequencies).to eq(h1)
    end
  end

  describe '#max' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.max).to eq(nil)
    end

    it 'to be 10' do
      expect(klass.max).to eq(10)
    end
  end

  describe '#mean' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.mean).to eq(nil)
    end

    it 'to be 3.4' do
      expect(klass.mean).to eq(3.4)
    end
  end

  describe '#median' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.median).to eq(nil)
    end

    it 'to be 2' do
      expect(klass.median).to eq(2)
    end

    it 'to be 2.5' do
      collection << 4
      klass = described_class.new(collection)

      expect(klass.median).to eq(2.5)
    end
  end

  describe '#min' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.min).to eq(nil)
    end

    it 'to be 1' do
      expect(klass.min).to eq(1)
    end
  end

  describe '#mode' do
    it 'to be nil when empty' do
      klass = described_class.new([])

      expect(klass.mode).to eq(nil)
    end

    it 'to be nil when equal frequencies' do
      klass = described_class.new([1, 2, 3])

      expect(klass.mode).to eq(nil)
    end

    it 'to be 1' do
      expect(klass.mode).to eq(1)
    end
  end

  describe '#proportions' do
    let(:h1) do
      {
        1 => 0.4,
        2 => 0.2,
        3 => 0.2,
        10 => 0.2
      }
    end

    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.proportions).to eq(nil)
    end

    it 'to be { ... }' do
      expect(klass.proportions).to eq(h1)
    end
  end

  describe '#range' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.range).to eq(nil)
    end

    it 'to be 9' do
      expect(klass.range).to eq(9)
    end
  end

  describe '#percentile_from_value' do
    let(:n1) { 10 }

    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.percentile_from_value(n1)).to eq(nil)
    end

    it 'to be 80' do
      expect(klass.percentile_from_value(n1)).to eq(80)
    end
  end

  describe '#value_from_percentile' do
    let(:n1) { 60 }

    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.value_from_percentile(n1)).to eq(nil)
    end

    it 'to be 3' do
      expect(klass.value_from_percentile(n1)).to eq(3)
    end
  end

  describe '#population_variance' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.population_variance).to eq(nil)
    end

    it 'to be 11.44' do
      expect(klass.population_variance).to eq(11.44)
    end
  end

  describe '#sample_variance' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.sample_variance).to eq(nil)
    end

    it 'to be 14.299999999999999' do
      expect(klass.sample_variance).to eq(14.299999999999999)
    end
  end

  describe '#population_coefficient_of_variation' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.population_coefficient_of_variation).to eq(nil)
    end

    it 'to be 0.994796148546339' do
      expect(klass.population_coefficient_of_variation).to eq(0.994796148546339)
    end
  end

  describe '#sample_coefficient_of_variation' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.sample_coefficient_of_variation).to eq(nil)
    end

    it 'to be 1.1122159059522962' do
      expect(klass.sample_coefficient_of_variation).to eq(1.1122159059522962)
    end
  end

  describe '#population_kurtosis' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.population_kurtosis).to eq(nil)
    end

    it 'to be 0' do
      allow(klass).to receive(:size).and_return(1)

      expect(klass.population_kurtosis).to eq(0)
    end

    it 'to be 3.75877182258301' do
      expect(klass.population_kurtosis).to eq(3.75877182258301)
    end
  end

  describe '#sample_kurtosis' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.sample_kurtosis).to eq(nil)
    end

    it 'to be 0' do
      allow(klass).to receive(:size).and_return(1)

      expect(klass.sample_kurtosis).to eq(0)
    end

    it 'to be 2.405613966453127' do
      expect(klass.sample_kurtosis).to eq(2.405613966453127)
    end
  end

  describe '#population_skewness' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.population_skewness).to eq(nil)
    end

    it 'to be 0' do
      allow(klass).to receive(:size).and_return(1)

      expect(klass.population_skewness).to eq(0)
    end

    it 'to be 1.66074014712668' do
      expect(klass.population_skewness).to eq(1.66074014712668)
    end
  end

  describe '#sample_skewness' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.sample_skewness).to eq(nil)
    end

    it 'to be 0' do
      allow(klass).to receive(:size).and_return(1)

      expect(klass.sample_skewness).to eq(0)
    end

    it 'to be 1.188328915820243' do
      expect(klass.sample_skewness).to eq(1.188328915820243)
    end
  end

  describe '#population_standard_deviation' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.population_standard_deviation).to eq(nil)
    end

    it 'to be 3.3823069050575527' do
      expect(klass.population_standard_deviation).to eq(3.3823069050575527)
    end
  end

  describe '#sample_standard_deviation' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.sample_standard_deviation).to eq(nil)
    end

    it 'to be 3.7815340802378072' do
      expect(klass.sample_standard_deviation).to eq(3.7815340802378072)
    end
  end

  describe '#population_standard_error' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.population_standard_error).to eq(nil)
    end

    it 'to be 1.512613632095123' do
      expect(klass.population_standard_error).to eq(1.512613632095123)
    end
  end

  describe '#sample_standard_error' do
    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.sample_standard_error).to eq(nil)
    end

    it 'to be 1.6911534525287761' do
      expect(klass.sample_standard_error).to eq(1.6911534525287761)
    end
  end

  describe '#population_zscore' do
    let(:a1) do
      [
        -0.7095748751868991,
        -0.7095748751868991,
        -0.4139186771923578,
        -0.11826247919781649,
        1.9513309067639724
      ]
    end

    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.population_zscore).to eq(nil)
    end

    it 'to be [ 0, ... ]' do
      allow(klass).to receive(:population_standard_deviation).and_return(0)

      expect(klass.population_zscore).to eq([0, 0, 0, 0, 0])
    end

    it 'to be [ ... ]' do
      expect(klass.population_zscore).to eq(a1)
    end
  end

  describe '#sample_zscore' do
    let(:a1) do
      [
        -0.6346630624175341,
        -0.6346630624175341,
        -0.37022011974356156,
        -0.105777177069589,
        1.7453234216482187
      ]
    end

    it 'to be nil' do
      klass = described_class.new([])

      expect(klass.sample_zscore).to eq(nil)
    end

    it 'to be [ 0, ... ]' do
      allow(klass).to receive(:sample_standard_deviation).and_return(0)

      expect(klass.sample_zscore).to eq([0, 0, 0, 0, 0])
    end

    it 'to be [ ... ]' do
      expect(klass.sample_zscore).to eq(a1)
    end
  end

end
