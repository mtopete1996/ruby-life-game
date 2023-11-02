# frozen_string_literal: true

require_relative 'base'

module PositionCalculator
  class MiddleLeft < Base
    private

    def calculate_position
      @coord_x -= 1
    end
  end
end
