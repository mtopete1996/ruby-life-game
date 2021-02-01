require_relative './neighbour'

# The Cell class is where all the cell actions happens and where the cell state is kept
class Cell
  def initialize(data)
    @state = data[:state] || :dead
    @grid = data[:grid]
    @previous_state = state
    @position = assign_position(data[:position])
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

  def can_revive?
    return if alive?

    neighbours.check! == 3
  end

  def grid=(grid)
    return unless grid.instance_of?(Grid)

    @grid = grid
    neighbours.grid = grid
  end

  def to_die?
    cells_around = neighbours.check!
    cells_around < 2 || cells_around > 3
  end

  def state_as_number
    return 1 if alive?

    0
  end

  private

  def assign_position(pos)
    raise ArgumentError, 'Position must exist: col and row' unless pos[:col] && pos[:row]
    raise ArgumentError, 'Position must not be out of limits' if out_of_limits?(pos)
    raise ArgumentError, 'Position must be zero or more' unless pos[:col] >= 0 && pos[:row] >= 0

    @position = pos
  end

  def col
    @col ||= position[:col]
  end

  def cols
    @cols ||= grid&.cols
  end

  def neighbours
    @neighbours ||= Neighbour.new(self)
  end

  def out_of_limits?(pos)
    return unless grid

    pos[:col] >= cols || pos[:row] >= rows
  end

  def row
    @row ||= position[:row]
  end

  def rows
    @rows ||= grid&.rows
  end
end
