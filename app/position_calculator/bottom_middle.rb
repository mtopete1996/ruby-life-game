# frozen_string_literal: true

module PositionCalculator
  class BottomMiddle < Base
    private

    def calculate_position
      @coord_y += 1
    end
  end
end
