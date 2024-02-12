# frozen_string_literal: true

class Grid
  # ROWS and COLS start at 0 and end at ROWS & COLS
  ROWS = 5
  COLS = 5

  class << self
    def init
      new(grid: nil)
    end
  end

  def initialize(grid: nil)
    @grid = grid || object
  end

  def object
    @object ||= present_or_populate
  end

  def populate(population_style = :random)
    Factory::GridObject.call(population_style:)
  end

  private

  def present_or_populate(population_style = :random)
    return if @grid

    populate(population_style)
  end
end
