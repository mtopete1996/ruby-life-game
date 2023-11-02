# frozen_string_literal: true

module PositionCalculator
  class Factory
    attr_reader :coord_x, :coord_y, :max_x, :max_y, :position

    POSITION_CLASSES = {
      top_left: 'PositionCalculator::TopLeft',
      top_middle: 'PositionCalculator::TopMiddle',
      top_right: 'PositionCalculator::TopRight',
      middle_left: 'PositionCalculator::MiddleLeft',
      middle_right: 'PositionCalculator::MiddleRight',
      bottom_left: 'PositionCalculator::BottomLeft',
      bottom_middle: 'PositionCalculator::BottomMiddle',
      bottom_right: 'PositionCalculator::BottomRight'
    }.freeze

    def initialize(coord_x:, coord_y:, max_x:, max_y:, position:)
      @coord_x = coord_x
      @coord_y = coord_y
      @max_x = max_x
      @max_y = max_y
      @position = position
    end

    def call
      position_class.new(coord_x:, coord_y:, max_x:, max_y:).call
    end

    private

    def position_class
      Object.const_get(POSITION_CLASSES[position])
    end
  end
end
