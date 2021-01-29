class Neighbour
  def initialize(cell)
    @row = cell.position[:row]
    @col = cell.position[:col]
    @cols = cell.grid.cols
    @rows = cell.grid.rows
  end

  attr_reader :col, :cols, :row, :rows

  def around
    neighbours_h = neighbours_hash

    {
      up_left: [neighbours_h[:previous_row], neighbours_h[:previous_col]],
      up: [neighbours_h[:previous_row], col],
      up_right: [neighbours_h[:previous_row], neighbours_h[:next_col]],
      left: [row, neighbours_h[:previous_col]],
      right: [row, neighbours_h[:next_col]],
      down_left: [neighbours_h[:next_row], neighbours_h[:previous_col]],
      down: [neighbours_h[:next_row], col],
      down_right: [neighbours_h[:next_row], neighbours_h[:next_col]]
    }
  end

  def check_neighbours
    alive = 0
    around.values.each do |cell|
      next unless cell[0] && cell[1]
      alive += 1 if object[cell[0]][cell[1]] == 1
    end
    alive
  end

  def col
    @col ||= cell.col
  end

  def neighbours_hash
    { previous_row: previous_row, next_row: next_row, previous_col: previous_col,
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

  def row
    @row ||= cell.row
  end
end
