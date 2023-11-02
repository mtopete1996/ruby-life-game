# frozen_string_literal: true

require_relative '../rspec_helper'

describe PositionCalculator::Factory do
  describe '#call' do
    subject { described_class.new(coord_x: 1, coord_y: 1, max_x: 3, max_y: 3, position:).call }

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
