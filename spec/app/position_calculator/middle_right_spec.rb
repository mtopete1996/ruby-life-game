# frozen_string_literal: true

require 'byebug'
require 'rspec'

require_relative '../../../app/position_calculator/middle_right'

describe PositionCalculator::MiddleRight do
  describe '#call' do
    subject { described_class.new(coord_x:, coord_y:, max_x:, max_y:).call }

    context 'when grid is 3 x 3' do
      # 2 is max because we start counting from 0
      let(:max_x) { 2 }
      let(:max_y) { 2 }

      context 'when cell x=1, y=1' do
        let(:coord_x) { 1 }
        let(:coord_y) { 1 }

        it { is_expected.to eq([2, 1]) }
      end

      context 'when cell x=0, y=0' do
        let(:coord_x) { 0 }
        let(:coord_y) { 0 }

        it { is_expected.to eq([1, 0]) }
      end

      context 'when cell x=2, y=2' do
        let(:coord_x) { 2 }
        let(:coord_y) { 2 }

        it { is_expected.to eq([nil, nil]) }
      end
    end
  end
end