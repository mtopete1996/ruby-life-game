require_relative './cell'
require_relative '../support/render_support'

# The Grid class is where the rendering of the grid itself happens, also is where
# the cells are initialized and randomized
class Grid
  include RenderSupport

  def initialize(rows, cols, obj = nil)
    @cols = cols
    @rows = rows
    @object = object(obj)

    validate_parameters
  end

  attr_reader :cols, :rows

  def assign_self_to_cells
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
        build_cols(row)
      end
    end
  end

  def play
    update
    log
  end

  def update
    loop_object { |cell| cell.neighbours.live_or_die }
    assign_previous_state
  end

  class << self
    def setup!(rows, cols)
      grid = new(rows, cols)
      grid.randomize
      grid
    end
  end

  private

  def assign_previous_state
    loop_object do |cell|
      cell.previous_state = cell.state
    end
  end

  def build_cols(row)
    Array.new(cols) { |col| Cell.new(position: { row: row, col: col }, grid: self) }
  end

  def valid_object?
    return true unless object

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
