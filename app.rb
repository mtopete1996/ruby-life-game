require './grid'
require './logger'

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

  def logger
    @logger ||= Logger.new(grid)
  end

  def start
    logger.print_grid
  end

  class << self
    def start!(rows, cols)
      app = new(rows, cols)
      app.start
    end
  end
end

App.start!(10, 10)
