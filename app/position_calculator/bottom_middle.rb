# frozen_string_literal: true

require_relative 'base'

module PositionCalculator
  class BottomMiddle < Base
    private

    def calculate_position
      @coord_x = coord_x
      @coord_y = coord_y + 1
    end
  end
end
