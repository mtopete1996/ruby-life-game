require_relative './grid'

# The App class is where the configuration of the app is done and runs the game
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

  def start
    while true
      grid.play!
      puts '--------'
      sleep 1.5
    end
  end

  class << self
    def start!(rows, cols)
      new(rows, cols).start
    end
  end
end
