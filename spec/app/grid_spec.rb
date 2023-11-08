# frozen_string_literal: true

require_relative '../rspec_helper'

describe Grid do
  describe '#object' do
    subject(:grid_object) { described_class.new.object }

    it { is_expected.to be_a(Array) }

    # These are +1 because the grid is 0-indexed, but the grid object is 1-indexed
    it { expect(grid_object.size).to eq(Grid::ROWS + 1) }
    it { expect(grid_object.first.size).to eq(Grid::COLS + 1) }
  end
end
