# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Enumerable do
  let(:collection) { [1, 1, 2, 3, 10] }

  describe '#frequencies' do
    let(:h1) do
      {
        1 => 2,
        2 => 1,
        3 => 1,
        10 => 1
      }
    end

    it 'to be { ... }' do
      expect(collection.frequencies).to eq(h1)
    end
  end

  describe '#mean' do
    let(:n1) { 3.4 }

    it 'to be 3.4 when mean' do
      expect(collection.mean).to eq(n1)
    end

    it 'to be 3.4 when average' do
      expect(collection.average).to eq(n1)
    end
  end

  describe '#median' do
    it 'to be 2' do
      expect(collection.median).to eq(2)
    end
  end

  describe '#mode' do
    it 'to be 1' do
      expect(collection.mode).to eq(1)
    end
  end

  describe '#percentile_from_value' do
    let(:n1) { 10 }
    let(:n2) { 80 }

    it 'to be 80 percentile_from_value' do
      expect(collection.percentile_from_value(n1)).to eq(n2)
    end

    it 'to be 80 percentile' do
      expect(collection.percentile(n1)).to eq(n2)
    end
  end

  describe '#product' do
    it 'to be 60' do
      expect(collection.product).to eq(60)
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

    it 'to be { ... }' do
      expect(collection.proportions).to eq(h1)
    end
  end

  describe '#range' do
    it 'to be 9' do
      expect(collection.range).to eq(9)
    end
  end

  describe '#value_from_percentile' do
    let(:n1) { 60 }
    let(:n2) { 3 }

    it 'to be 3 for value_from_percentile' do
      expect(collection.value_from_percentile(n1)).to eq(n2)
    end

    it 'to be 3 for percentile_rank' do
      expect(collection.percentile_rank(n1)).to eq(n2)
    end
  end

  describe '#population_coefficient_of_variation' do
    it 'to be 1.1122159059522962' do
      expect(collection.population_coefficient_of_variation).to eq(1.1122159059522962)
    end
  end

  describe '#population_kurtosis' do
    it 'to be 2.405613966453127' do
      expect(collection.population_kurtosis).to eq(2.405613966453127)
    end
  end

  describe '#population_skewness' do
    it 'to be 1.188328915820243' do
      expect(collection.population_skewness).to eq(1.188328915820243)
    end
  end

  describe '#population_size' do
    it 'to be 4' do
      expect(collection.population_size).to eq(4)
    end
  end

  describe '#population_standard_deviation' do
    it 'to be 3.7815340802378072' do
      expect(collection.population_standard_deviation).to eq(3.7815340802378072)
    end
  end

  describe '#population_standard_error' do
    it 'to be 1.8907670401189036' do
      expect(collection.population_standard_error).to eq(1.8907670401189036)
    end
  end

  describe '#population_variance' do
    it 'to be 14.299999999999999' do
      expect(collection.population_variance).to eq(14.299999999999999)
    end
  end

  describe '#population_zscore' do
    let(:a1) do
      [
        -0.6346630624175341,
        -0.6346630624175341,
        -0.37022011974356156,
        -0.105777177069589,
        1.7453234216482187
      ]
    end

    it 'to be [ ... ]' do
      expect(collection.population_zscore).to eq(a1)
    end
  end

  describe '#sample_coefficient_of_variation' do
    let(:n1) { 0.994796148546339 }

    it 'to be 0.994796148546339 for sample_coefficient_of_variation' do
      expect(collection.sample_coefficient_of_variation).to eq(n1)
    end

    it 'to be 0.994796148546339 for coefficient_of_variation' do
      expect(collection.coefficient_of_variation).to eq(n1)
    end
  end

  describe '#sample_kurtosis' do
    let(:n1) { 3.007017458066408 }

    it 'to be 3.007017458066408 for sample_kurtosis' do
      expect(collection.sample_kurtosis).to eq(n1)
    end

    it 'to be 3.007017458066408 for kurtosis' do
      expect(collection.kurtosis).to eq(n1)
    end
  end

  describe '#sample_skewness' do
    let(:n1) { 1.328592117701344 }

    it 'to be 1.328592117701344 for sample_skewness' do
      expect(collection.sample_skewness).to eq(n1)
    end

    it 'to be 1.328592117701344 for skewness' do
      expect(collection.skewness).to eq(n1)
    end
  end

  describe '#sample_size' do
    it 'to be 5' do
      expect(collection.sample_size).to eq(5)
    end
  end

  describe '#sample_standard_deviation' do
    let(:n1) { 3.3823069050575527 }

    it 'to be 3.3823069050575527 for sample_standard_deviation' do
      expect(collection.sample_standard_deviation).to eq(n1)
    end

    it 'to be 3.3823069050575527 for standard_deviation' do
      expect(collection.standard_deviation).to eq(n1)
    end
  end

  describe '#sample_standard_error' do
    let(:n1) { 1.512613632095123 }

    it 'to be 1.512613632095123 for sample_standard_error' do
      expect(collection.sample_standard_error).to eq(n1)
    end

    it 'to be 1.512613632095123 for standard_error' do
      expect(collection.standard_error).to eq(n1)
    end
  end

  describe '#sample_variance' do
    let(:n1) { 11.44 }

    it 'to be 11.44 for sample_variance' do
      expect(collection.sample_variance).to eq(n1)
    end

    it 'to be 11.44 for variance' do
      expect(collection.variance).to eq(n1)
    end
  end

  describe '#sample_zscore' do
    let(:a1) do
      [
        -0.7095748751868991,
        -0.7095748751868991,
        -0.4139186771923578,
        -0.11826247919781649,
        1.9513309067639724
      ]
    end

    it 'to be [ ... ] for sample_zscore' do
      expect(collection.sample_zscore).to eq(a1)
    end

    it 'to be [ ... ] for zscore' do
      expect(collection.zscore).to eq(a1)
    end
  end

end
