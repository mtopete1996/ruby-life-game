# frozen_string_literal: true

require_relative '../rspec_helper'

describe Populator do
  describe '#call' do
    subject(:matrix) { described_class.call }

    context 'when grid is 3 x 3' do
      before do
        stub_const('Grid::ROWS', 2)
        stub_const('Grid::COLS', 2)
      end

      it 'returns a 3 rows matrix' do
        expect(matrix.length).to eq(3)
      end

      it 'first row returns an array of 3' do
        expect(matrix[0].length).to eq(3)
      end

      it 'second row returns an array of 3' do
        expect(matrix[1].length).to eq(3)
      end

      it 'third row returns an array of 3' do
        expect(matrix[2].length).to eq(3)
      end

      it 'all items are Cells' do
        expect(matrix.flatten.all? { |item| item.is_a?(Cell) }).to be(true)
      end
    end
  end
end
