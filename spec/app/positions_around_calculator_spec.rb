# frozen_string_literal: true

require_relative 'rspec_helper'

describe PositionsAroundCalculator do
  describe '#call' do
    subject(:positions_hash) { described_class.new(coord_x:, coord_y:, max_x:, max_y:).call }

    # 2 is max because we start counting from 0
    let(:max_x) { 2 }
    let(:max_y) { 2 }

    context 'when coord_x=1 and coord_y=1' do
      let(:coord_x) { 1 }
      let(:coord_y) { 1 }

      let(:expected_result) do
        {
          top_left: [0, 0],
          top_middle: [1, 0],
          top_right: [2, 0],
          middle_left: [0, 1],
          middle_right: [2, 1],
          bottom_left: [0, 2],
          bottom_middle: [1, 2],
          bottom_right: [2, 2]
        }
      end

      it { is_expected.to eq(expected_result) }
    end

    context 'when coord_x=0 and coord_y=0' do
      let(:coord_x) { 0 }
      let(:coord_y) { 0 }

      let(:expected_result) do
        {
          top_left: [nil, nil],
          top_middle: [nil, nil],
          top_right: [nil, nil],
          middle_left: [nil, nil],
          middle_right: [1, 0],
          bottom_left: [nil, nil],
          bottom_middle: [0, 1],
          bottom_right: [1, 1]
        }
      end

      it { is_expected.to eq(expected_result) }
    end

    context 'when coord_x=1 and coord_y=2' do
      let(:coord_x) { 1 }
      let(:coord_y) { 2 }

      let(:expected_result) do
        {
          top_left: [0, 1],
          top_middle: [1, 1],
          top_right: [2, 1],
          middle_left: [0, 2],
          middle_right: [2, 2],
          bottom_left: [nil, nil],
          bottom_middle: [nil, nil],
          bottom_right: [nil, nil]
        }
      end

      it { is_expected.to eq(expected_result) }
    end
  end
end
