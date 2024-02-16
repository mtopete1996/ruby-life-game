# frozen_string_literal: true

require_relative '../../spec_helper'

describe PositionCalculator::BottomLeft do
  describe '#call' do
    subject { described_class.new(coord_x:, coord_y:).call }

    context 'when grid is 3 x 3' do
      before do
        stub_const('Grid::ROWS', 2)
        stub_const('Grid::COLS', 2)
      end

      context 'when cell x=1, y=1' do
        let(:coord_x) { 1 }
        let(:coord_y) { 1 }

        it { is_expected.to eq([0, 2]) }
      end

      context 'when cell x=0, y=0' do
        let(:coord_x) { 0 }
        let(:coord_y) { 0 }

        it { is_expected.to eq([nil, nil]) }
      end

      context 'when cell x=0, y=2' do
        let(:coord_x) { 0 }
        let(:coord_y) { 2 }

        it { is_expected.to eq([nil, nil]) }
      end
    end
  end
end
