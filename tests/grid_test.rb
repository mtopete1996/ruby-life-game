require 'minitest/autorun'
require '../grid'

class TestGrid < Minitest::Test
  def test_grid_object_is_right_size
    assert_equal 8, grid.rows
    assert_equal 9, grid.cols

    assert_equal 8, grid.object.length
    assert_equal 9, grid.object[0].length
  end

  def test_setup_class_method
    grid_setup = Grid.setup!(6, 7)

    assert_equal 6, grid_setup.length
    assert_equal 7, grid_setup[0].length
  end

  private

  def setup
    @grid = grid
  end

  def grid
    @grid ||= Grid.new(8, 9)
  end
end
