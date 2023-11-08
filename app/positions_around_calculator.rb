# frozen_string_literal: true

class PositionsAroundCalculator
  # Attributes
  attr_reader :coord_x, :coord_y

  # Class methods
  class << self
    def call(coord_x:, coord_y:)
      new(coord_x:, coord_y:).call
    end
  end

  # Constructor
  def initialize(coord_x:, coord_y:)
    @coord_x = coord_x
    @coord_y = coord_y
  end

  # Instance methods
  def call
    PositionCalculator::Factory::POSITION_CLASSES.keys.each_with_object({}) do |position, obj|
      obj[position] = positions_calculator_factory.call(position:).call
    end
  end

  private

  def positions_calculator_factory
    @positions_calculator_factory ||= PositionCalculator::Factory.new(coord_x:, coord_y:)
  end
end
