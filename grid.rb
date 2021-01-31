require './logger'
require './cell'

class Grid
  def initialize(rows, cols, obj = nil)
    @cols = cols
    @rows = rows
    @object = object(obj)

    validate_parameters
  end

  attr_reader :cols, :rows

  def assign_self_to_cells!
    object.each do |row|
      row.each_index do |col_index|
        row[col_index].grid = self
      end
    end
  end

  def object(obj = nil)
    return obj if obj

    @object ||= begin
      (0...rows).map do |row|
        Array.new(cols) { |col| Cell.new(position: { row: row, col: col }, grid: self) }
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

  def print!
    logger.print_grid
  end

  class << self
    def setup!(rows, cols)
      new(rows, cols).randomize!
    end
  end

  private

  def logger
    @logger ||= Logger.new(self)
  end

  def random_state(cell)
    return cell.alive! if rand(2) == 1

    cell.dead!
  end

  def valid_object?
    return false if object.nil?

    object.instance_of?(Array) && !object.flatten.empty?
  end

  def validate_parameters
    return if valid_sizing? && valid_object?

    raise ArgumentError, 'rows and cols should be greater than 0'
  end

  def valid_sizing?
    rows.positive? && cols.positive?
  end
end
