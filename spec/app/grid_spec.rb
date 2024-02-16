 # frozen_string_literal: true

require_relative '../spec_helper'

describe Grid do
  describe '#object' do
    context 'when no population style provided' do
      subject(:grid_object) { described_class.new.object }

      it 'calls populate with random population style' do
        expect(Factory::GridObject).to receive(:random).and_call_original
        grid_object
      end

      it { is_expected.to be_a(Array) }

      # Assertions are +1 because the grid is 0-indexed, but the grid object is 1-indexed
      it { expect(grid_object.size).to eq(Grid::ROWS + 1) }
      it { expect(grid_object.first.size).to eq(Grid::COLS + 1) }
    end
  end

  describe '#populate' do
    context 'when population style is invalid' do
      subject(:subject_error) { described_class.new.populate(:invalid) }

      it { expect { subject_error }.to raise_error(ArgumentError, 'Invalid population style') }
    end
  end
end
