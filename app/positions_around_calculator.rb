# frozen_string_literal: true

class PositionsAroundCalculator
  attr_reader :coord_x, :coord_y, :max_x, :max_y

  def initialize(coord_x:, coord_y:, max_x:, max_y:)
    @coord_x = coord_x
    @coord_y = coord_y
    @max_x = max_x
    @max_y = max_y
  end

  def call
    PositionCalculator::Factory::POSITION_CLASSES.keys.each_with_object({}) do |position, obj|
      obj[position] = positions_calculator_factory.call(position:).call
    end
  end

  private

  def positions_calculator_factory
    @positions_calculator_factory ||= PositionCalculator::Factory.new(coord_x:, coord_y:, max_x:, max_y:)
  end
end
