# frozen_string_literal: true

class Populator
  # Class methods
  class << self
    def call
      (0..Grid::ROWS).map do |y|
        (0..Grid::COLS).map do |x|
          Cell.new(coord_x: x, coord_y: y, state: Cell::STATES.sample)
        end
      end
    end
  end
end
