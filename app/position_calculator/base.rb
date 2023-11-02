# frozen_string_literal: true

module PositionCalculator
  class Base
    # Attributes
    attr_reader :coord_x, :coord_y, :max_x, :max_y

    # Constructor
    def initialize(coord_x:, coord_y:, max_x:, max_y:)
      @coord_x = coord_x
      @coord_y = coord_y
      @max_x = max_x
      @max_y = max_y
    end

    # Instance methods
    def call
      calculate_position
      nillify_coords
      coords
    end

    private

    def calculate_position
      raise(NotImplementedError, 'You must define this abstract method')
    end

    def coords
      [coord_x, coord_y]
    end

    def nillify_coords
      @coord_x = @coord_y = nil if greater_coords
    end

    def greater_coords
      [coord_x, coord_y].any?(&:negative?) || coord_x > max_x || coord_y > max_y
    end
  end
end
