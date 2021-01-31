require_relative './neighbour'

class Cell
  def initialize(data)
    @state = data[:state] || :dead
    @grid = data[:grid]
    @position = assign_position(data[:position])
  end

  attr_reader :grid, :position, :state

  STATES = %i[alive dead].freeze

  STATES.each do |status|
    define_method("#{status}?", -> { state == status })
    define_method("#{status}!", -> { @state = status })
  end

  def grid=(grid)
    return unless grid.instance_of?(Grid)

    @grid = grid
    neighbours.grid = grid
  end

  def state_as_number
    return 1 if alive?

    0
  end

  def neighbours
    @neighbours ||= Neighbour.new(self)
  end

  private

  def assign_position(pos)
    raise ArgumentError, 'Position must exist: col and row' unless pos[:col] && pos[:row]
    raise ArgumentError, 'Position must not be out of limits' if out_of_limits?(pos)
    raise ArgumentError, 'Position must be zero or more' unless pos[:col] >= 0 && pos[:row] >= 0

    @position = pos
  end

  def out_of_limits?(pos)
    return unless grid

    pos[:col] >= cols || pos[:row] >= rows
  end

  def col
    @col ||= position[:col]
  end

  def cols
    return unless grid

    @cols ||= grid.cols
  end

  def row
    @row ||= position[:row]
  end

  def rows
    return unless grid

    @rows ||= grid.rows
  end
end
