class Grid
  def initialize(rows, cols)
    @cols = cols
    @rows = rows
  end

  attr_reader :cols, :rows

  def neighbours(row, col)
    previous_row = row - 1
    next_row = row + 1
    previous_col = col - 1
    next_col = col + 1

    [
      [previous_row, previous_col], [previous_row, col], [previous_row, next_col],
      [row, previous_col], [row, next_col],
      [next_row, previous_col], [next_row, col], [next_row, next_col]
    ]
  end

  def object
    @object ||= (1..rows).map do
      Array.new cols
    end
  end

  def randomize
    object.each do |row|
      row.each_index do |c_index|
        row[c_index] = rand(2)
      end
    end
  end

  class << self
    def setup!(rows, cols)
      new(rows, cols).randomize
    end
  end
end
