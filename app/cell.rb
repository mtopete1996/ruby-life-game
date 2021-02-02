require_relative './neighbour'

# The Cell class is where all the cell actions happens and where the cell state is kept
class Cell
  def initialize(data)
    @state = data[:state] || :dead
    @grid = data[:grid]
    @previous_state = state
    assign_position(data[:position])
  end

  attr_accessor :previous_state
  attr_reader :grid, :position, :state

  STATES = %i[alive dead].freeze

  STATES.each do |status|
    define_method("#{status}?", -> { state == status })
    define_method("#{status}!", -> { @state = status })
  end

  def alive
    alive!
    @previous_state = :alive
  end

  def dead
    dead!
    @previous_state = :dead
  end

  def grid=(grid)
    return unless grid.instance_of?(Grid)

    @grid = grid
    neighbours.grid = grid
  end

  def neighbours
    @neighbours ||= Neighbour.new(self)
  end

  def random_state
    alive if rand(2) == 1

    dead
  end

  def state_as_number
    return 1 if alive?

    0
  end

  private

  def assign_position(pos)
    return if validate_position(pos[:row], pos[:col])

    @position = pos
  end

  def col
    @col ||= position[:col]
  end

  def cols
    @cols ||= grid&.cols
  end

  def out_of_limits?(pos_row, pos_col)
    return unless grid

    pos_col >= cols || pos_row >= rows
  end

  def row
    @row ||= position[:row]
  end

  def rows
    @rows ||= grid&.rows
  end

  def validate_position(pos_row, pos_col)
    raise ArgumentError, 'Position must exist: col and row' unless pos_col && pos_row
    raise ArgumentError, 'Position must not be out of limits' if out_of_limits?(pos_row, pos_col)
    raise ArgumentError, 'Position must be zero or more' unless pos_col >= 0 && pos_row >= 0
  end
end
