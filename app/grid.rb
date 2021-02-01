require_relative './logger'
require_relative './cell'

# The Grid class is where the rendering of the grid itself happens, also is where
# the cells are initialized and randomized
class Grid
  def initialize(rows, cols, obj = nil)
    @cols = cols
    @rows = rows
    @object = object(obj)

    validate_parameters
  end

  attr_reader :cols, :rows

  def assign_self_to_cells!
    loop_object do |cell|
      cell.grid = self
    end
  end

  def dead?
    object.all? do |row|
      row.all?(&:dead?)
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
    loop_object do |cell|
      random_state(cell)
    end
  end

  def play!
    update!
    print!
  end

  def print!
    logger.print_grid
  end

  def update!
    loop_object do |cell|
      next cell.dead! if cell.to_die?

      cell.alive! if cell.can_revive?
    end

    loop_object do |cell|
      cell.previous_state = cell.state
    end
  end

  class << self
    def setup!(rows, cols)
      grid = new(rows, cols)
      grid.randomize!
      grid
    end
  end

  private

  def loop_object(&block)
    object.each do |row|
      row.each do |cell|
        block.call(cell)
      end
    end
  end

  def logger
    @logger ||= Logger.new(self)
  end

  def random_state(cell)
    return cell.alive if rand(2) == 1

    cell.dead
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
