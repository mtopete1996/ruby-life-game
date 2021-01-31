require_relative './grid'
require_relative './logger'

class App
  def initialize(rows, cols)
    @cols = cols
    @rows = rows
    @grid = grid
  end

  attr_reader :cols, :rows

  def grid
    @grid ||= Grid.setup!(rows, cols)
  end

  class << self
    def start!(rows, cols)
      new(rows, cols)
    end
  end
end

App.start!(10, 10)
