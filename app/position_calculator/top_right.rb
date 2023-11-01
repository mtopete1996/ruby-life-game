# frozen_string_literal: true

require_relative 'base'

module PositionCalculator
  class TopRight < Base
    private

    def calculate_position
      @coord_x = coord_x + 1
      @coord_y = coord_y - 1
    end
  end
end
