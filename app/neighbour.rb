require_relative './grid'
require_relative '../support/neighbour_hash_support'

# The Neighbour class is where all the cell neighbour calculations are made
class Neighbour
  include NeighbourHashSupport

  def initialize(cell)
    @cell = cell
    @row = cell.position[:row]
    @col = cell.position[:col]
    @grid = cell&.grid
  end

  def can_revive?
    return if cell.alive?

    check! == 3
  end

  def check!
    alive = 0

    around.each_value do |cell|
      x, y = cell
      next unless x && y

      alive += 1 if grid.object[x][y].previous_state == :alive
    end
    alive
  end

  def live_or_die
    return cell.dead! if to_die?

    cell.alive! if can_revive?
  end

  def to_die?
    cells_around = check!
    cells_around < 2 || cells_around > 3
  end

  def grid=(grid)
    @grid = grid if grid.instance_of?(Grid)
  end

  private

  attr_reader :cell, :col, :grid, :row

  def around
    up_neighbours.merge(lateral_neigbours, down_neighbours)
  end

  def cols
    @cols ||= grid&.cols
  end

  def rows
    @rows ||= grid&.rows
  end
end
