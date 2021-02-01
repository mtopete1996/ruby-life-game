require_relative './grid'

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
      app = new(rows, cols)

      while true do
        app.grid.play!
        puts '--------'
        sleep 1.5
      end
    end
  end
end
