# frozen_string_literal: true

module PositionCalculator
  class TopMiddle < Base
    private

    def calculate_position
      @coord_y -= 1
    end
  end
end
