require './logger'

class Grid
  def initialize(rows, cols, obj = nil)
    @cols = cols
    @rows = rows
    @object = object(obj)
  end

  def check_neighbours(row, col)
    alive = 0
    neighbours(row, col).each do |cell|
      next unless cell[0] && cell[1]
      alive += 1 if object[cell[0]][cell[1]] == 1
    end
    alive
  end

  def object(obj = nil)
    @object ||= begin
      return obj if obj

      (1..rows).map do
        Array.new cols
      end
    end
  end

  def randomize!
    object.each do |row|
      row.each_index do |c_index|
        row[c_index] = rand(2)
      end
    end
  end

  class << self
    def setup!(rows, cols)
      new(rows, cols).randomize!
    end
  end

  private

  attr_reader :cols, :rows

  def neighbours(row, col)
    raise ArgumentError, 'Arguments row and/or col are offset' if row > rows || col > cols
    neighbours_h = neighbours_hash(row, col)

    [
      [neighbours_h[:previous_row], neighbours_h[:previous_col]], [neighbours_h[:previous_row], col],
      [neighbours_h[:previous_row], neighbours_h[:next_col]],
      [row, neighbours_h[:previous_col]], [row, neighbours_h[:next_col]],
      [neighbours_h[:next_row], neighbours_h[:previous_col]], [neighbours_h[:next_row], col],
      [neighbours_h[:next_row], neighbours_h[:next_col]]
    ]
  end

  def neighbours_hash(row, col)
    { previous_row: previous_row(row), next_row: next_row(row), previous_col: previous_col(col),
      next_col: next_col(col) }
  end

  def next_col(col)
    next_r = col + 1
    next_r if next_r < cols
  end

  def next_row(row)
    next_r = row + 1
    next_r if next_r < rows
  end

  def previous_col(col)
    previous = col - 1
    previous if previous >= 0
  end

  def previous_row(row)
    previous = row - 1
    previous if previous >= 0
  end
end
