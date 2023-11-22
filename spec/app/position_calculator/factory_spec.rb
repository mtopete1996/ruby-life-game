# frozen_string_literal: true

require_relative '../../rspec_helper'

describe PositionCalculator::Factory do
  describe '.call' do
    subject(:call) { described_class.call(coord_x: 1, coord_y: 1, position:) }

    context 'when position is top_left' do
      let(:position) { :top_left }

      it { is_expected.to be_a(PositionCalculator::TopLeft).and have_attributes(coord_x: 1, coord_y: 1) }
    end

    context 'when position is not on the list' do
      let(:position) { :not_valid }

      it { expect { call }.to raise_error(ArgumentError, 'This is not a valid position') }
    end
  end

  describe '#call' do
    subject(:call) { described_class.new(coord_x: 1, coord_y: 1).call(position:) }

    before do
      stub_const('Grid::ROWS', 2)
      stub_const('Grid::COLS', 2)
    end

    context 'when position is top_left' do
      let(:position) { :top_left }

      it { is_expected.to be_a(PositionCalculator::TopLeft).and have_attributes(coord_x: 1, coord_y: 1) }
    end

    context 'when position is middle_right' do
      let(:position) { :middle_right }

      it { is_expected.to be_a(PositionCalculator::MiddleRight).and have_attributes(coord_x: 1, coord_y: 1) }
    end

    context 'when position is not on the list' do
      let(:position) { :not_valid }

      it { expect { call }.to raise_error(ArgumentError, 'This is not a valid position') }
    end
  end
end
