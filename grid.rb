require './logger'
require './cell'

class Grid
  def initialize(rows, cols, obj = nil)
    @cols = cols
    @rows = rows
    @object = object(obj)
  end

  attr_reader :cols, :rows

  def object(obj = nil)
    @object ||= begin
      return obj if obj

      (1..rows).map do |row|
        Array.new(cols) { |col| Cell.new({ grid: self, position: { row: row, col: col } }) }
      end
    end
  end

  def randomize!
    object.each do |row|
      row.each_index do |col_index|
        random_state(row[col_index])
      end
    end
  end

  class << self
    def setup!(rows, cols)
      new(rows, cols).randomize!
    end
  end

  private

  def random_state(cell)
    return cell.alive! if rand(2) == 1

    cell.dead!
  end
end
