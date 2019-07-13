# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Statistics::Base do
  let(:collection) { [1, 2, 3] }
  let(:klass) { described_class.new(collection) }

  describe '#calculate' do
    it 'to be 2.0 when calculated using class method' do
      results = Lite::Statistics::Mean.calculate(collection)

      expect(results).to eq(2.0)
    end
  end

end
