# frozen_string_literal: true

require_relative '../../rspec_helper'

describe PositionCalculator::Base do
  let(:calculator) { described_class.new(coord_x: 0, coord_y: 0) }

  describe '#call' do
    subject(:call) { calculator.call }

    it { expect { call }.to raise_error(NotImplementedError) }
  end

  describe '#coords' do
    subject { calculator.send(:coords) }

    it { is_expected.to eq([0, 0]) }
  end

  describe '#nillify_coords' do
    subject(:nillify_coords) { calculator.send(:nillify_coords) }

    let(:calculator) { described_class.new(coord_x: -1, coord_y: 0) }

    it { expect { nillify_coords }.to change(calculator, :coord_x).from(-1).to(nil) }
    it { expect { nillify_coords }.to change(calculator, :coord_y).from(0).to(nil) }
  end

  describe '#out_of_limits' do
    subject(:out_of_limits) { calculator.send(:out_of_limits) }

    context 'when coord_x is negative AND coord_y is positive' do
      let(:calculator) { described_class.new(coord_x: -1, coord_y: 1) }

      it { is_expected.to be(true) }
    end

    context 'when coord_x is positive AND coord_y is negative' do
      let(:calculator) { described_class.new(coord_x: 1, coord_y: -1) }

      it { is_expected.to be(true) }
    end

    context 'when coord_x is 0 AND coord_y is 0' do
      let(:calculator) { described_class.new(coord_x: 0, coord_y: 0) }

      it { is_expected.to be(false) }
    end

    context 'when coord_x is positive AND coord_y is 0' do
      let(:calculator) { described_class.new(coord_x: 1, coord_y: 0) }

      it { is_expected.to be(false) }
    end
  end
end
