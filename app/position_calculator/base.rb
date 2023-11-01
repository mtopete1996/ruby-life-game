# frozen_string_literal: true

module PositionCalculator
  class Base
    attr_reader :coord_x, :coord_y

    def initialize(coord_x:, coord_y:)
      @coord_x = coord_x
      @coord_y = coord_y
    end

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
      return if [coord_x, coord_y].none?(&:negative?)

      @coord_x = @coord_y = nil
    end
  end
end
