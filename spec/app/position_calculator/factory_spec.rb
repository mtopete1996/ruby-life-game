# frozen_string_literal: true

require_relative '../rspec_helper'

describe PositionCalculator::Factory do
  describe '#call' do
    subject { described_class.new(coord_x: 1, coord_y: 1, position:).call }

    before do
      stub_const('Grid::ROWS', 2)
      stub_const('Grid::COLS', 2)
    end

    context 'when position is top_left' do
      let(:position) { :top_left }

      it { is_expected.to be(PositionCalculator::TopLeft) }
    end

    context 'when position is middle_right' do
      let(:position) { :middle_right }

      it { is_expected.to be(PositionCalculator::MiddleRight) }
    end
  end
end
