# frozen_string_literal: true

module PositionCalculator
  class BottomLeft < Base
    private

    def calculate_position
      @coord_x -= 1
      @coord_y += 1
    end
  end
end
