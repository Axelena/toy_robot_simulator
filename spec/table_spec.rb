require 'rspec'
require 'spec_helper'
require './lib/table'

describe Table do
  describe '#initialize' do
    it 'has valid width' do
      instance = Table.new
      expect(instance.width).to be_a Integer
      expect(instance.width).to eq 5
    end

    it 'has valid height' do
      instance = Table.new
      expect(instance.height).to be_a Integer
      expect(instance.height).to eq 5
    end
  end

  describe '#inside_table?' do
    before do
    end
    it 'returns true when x and y attributes are valid' do
      instance = Table.new
      expect(instance.inside_table?(0, 1)).to be true
    end

    it 'returns false when x and y attributes are too big' do
      instance = Table.new
      expect(instance.inside_table?(6, 6)).to be false
    end

    it 'returns false when only x attribute is too big' do
      instance = Table.new
      expect(instance.inside_table?(6, 0)).to be false
    end

    it 'returns false when only y attribute is too big' do
      instance = Table.new
      expect(instance.inside_table?(0, 6)).to be false
    end

    it 'returns false when x and y attributes are negative' do
      instance = Table.new
      expect(instance.inside_table?(-1, -1)).to be false
    end
  end

  describe '#valid_vector?' do
    it 'returns true when vector is not from vectors array' do
      instance = Table.new
      expect(instance.send(:valid_vector?, "NORTH")).to be true
    end

    it 'returns false when vector is not from vectors array' do
      instance = Table.new
      expect(instance.send(:valid_vector?, "Blah")).to be false
    end
  end
end
