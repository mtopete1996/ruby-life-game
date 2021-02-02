require 'minitest/autorun'
require_relative './support/hardcode_grid_support'
require_relative '../app/neighbour'
require_relative '../app/cell'

class TestNeighbour < Minitest::Test
  include HardcodeGridSupport

  def test_around_method
    neighbours_around = { up_left: [0, 0], up: [0, 1], up_right: [0, 2], left: [1, 0], right: [1, 2],
                          down_left: [2, 0], down: [2, 1], down_right: [2, 2] }

    assert_equal neighbours_around, neighbours.send(:around)
  end

  def test_check_method
    assert_equal 2, neighbours.check!
  end

  private

  def grid
    @grid ||= Grid.new(3, 3, hardcode_grid).tap(&:assign_self_to_cells)
  end

  def neighbours
    @neighbours ||= Neighbour.new(grid.object[1][1])
  end
end
