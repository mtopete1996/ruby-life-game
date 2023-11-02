# frozen_string_literal: true

require_relative 'base'

module PositionCalculator
  class TopMiddle < Base
    private

    def calculate_position
      @coord_y -= 1
    end
  end
end
