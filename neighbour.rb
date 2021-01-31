require './grid'

class Neighbour
  def initialize(cell)
    @row = cell.position[:row]
    @col = cell.position[:col]
    @grid = cell.grid if cell.grid
  end

  def check!
    alive = 0
    around.each_value do |cell|
      next unless cell[0] && cell[1]

      alive += 1 if grid.object[cell[0]][cell[1]].alive?
    end
    alive
  end

  def grid=(grid)
    @grid = grid if grid.instance_of?(Grid)
  end

  private

  attr_reader :col, :grid, :row

  def around
    up_neighbours.merge(lateral_neigbours, down_neighbours)
  end

  def cols
    return unless grid

    @cols ||= grid.cols
  end

  def down_neighbours
    { down_left: [neighbours_hash[:next_row], neighbours_hash[:previous_col]],
      down: [neighbours_hash[:next_row], col],
      down_right: [neighbours_hash[:next_row], neighbours_hash[:next_col]] }
  end

  def lateral_neigbours
    {
      left: [row, neighbours_hash[:previous_col]],
      right: [row, neighbours_hash[:next_col]]
    }
  end

  def neighbours_hash
    @neighbours_hash ||= { previous_row: previous_row, next_row: next_row, previous_col: previous_col,
                           next_col: next_col }
  end

  def next_col
    next_r = col + 1
    next_r if next_r < cols
  end

  def next_row
    next_r = row + 1
    next_r if next_r < rows
  end

  def previous_col
    previous = col - 1
    previous if previous >= 0
  end

  def previous_row
    previous = row - 1
    previous if previous >= 0
  end

  def rows
    return unless grid

    @rows ||= grid.rows
  end

  def up_neighbours
    { up_left: [neighbours_hash[:previous_row], neighbours_hash[:previous_col]],
      up: [neighbours_hash[:previous_row], col],
      up_right: [neighbours_hash[:previous_row], neighbours_hash[:next_col]] }
  end
end
