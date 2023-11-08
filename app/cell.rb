# frozen_string_literal: true

class Cell
  attr_reader :coord_x, :coord_y, :state

  STATES = %i[alive dead].freeze

  def initialize(coord_x:, coord_y:, state: :alive)
    @coord_x = coord_x
    @coord_y = coord_y
    @state = state
  end

  def cells_around_positions
    @cells_around_positions ||= PositionsAroundCalculator.call(coord_x:, coord_y:)
  end
end
