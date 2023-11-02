# frozen_string_literal: true

module PositionCalculator
  class MiddleRight < Base
    private

    def calculate_position
      @coord_x += 1
    end
  end
end
