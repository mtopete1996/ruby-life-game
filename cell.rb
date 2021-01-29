require './neighbour'

class Cell
  def initialize(data)
    @position = assign_position(data[:position])
    @state = data[:state] || :dead
    @grid = data[:grid]
  end

  attr_reader :grid, :position, :state

  STATES = %i[alive dead]

  STATES.each do |status|
    define_method("#{status}?", -> { state == status })
    define_method("#{status}!", -> { @state = status })
  end

  def state_as_number
    return 1 if alive?

    0
  end

  def neighbours
    @neigbours ||= Neighbour.new(self)
  end

  private

  def assign_position(pos)
    return unless pos[:col] && pos[:row]

    @position = pos
  end

  def col
    @col ||= position[:col]
  end

  def row
    @row ||= position[:row]
  end
end
