# frozen_string_literal: true

module PositionCalculator
  class Factory
    # Attributes
    attr_reader :coord_x, :coord_y, :position

    # Constants
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

    # Class methods
    class << self
      def call(coord_x:, coord_y:, position:)
        new(coord_x:, coord_y:).call(position:)
      end
    end

    # Constructor
    def initialize(coord_x:, coord_y:)
      @coord_x = coord_x
      @coord_y = coord_y
    end

    # Instance methods
    def call(position:)
      validate_position(position:)
      create_instance(position:)
    end

    private

    def validate_position(position:)
      return if POSITION_CLASSES.keys.include?(position)

      raise(ArgumentError, 'This is not a valid position')
    end

    def create_instance(position:)
      Object.const_get(POSITION_CLASSES[position]).new(coord_x:, coord_y:)
    end
  end
end
