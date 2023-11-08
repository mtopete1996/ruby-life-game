# frozen_string_literal: true

require_relative '../rspec_helper'

describe Cell do
  let(:alive_cell) { described_class.new(coord_x: 1, coord_y: 1, state: :alive) }

  describe '#cells_around_positions' do
    subject { alive_cell.cells_around_positions }

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
end
