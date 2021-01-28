require 'minitest/autorun'
require '../grid'

class TestGrid < Minitest::Test
  def test_grid_object_is_right_size
    assert_equal 8, grid.rows
    assert_equal 9, grid.cols

    assert_equal 8, grid.object.length
    assert_equal 9, grid.object[0].length
  end

  def test_neighbours_method
    neighbours = [[2, 2], [2, 3], [2, 4], [3, 2], [3, 4], [4, 2], [4, 3], [4, 4]]

    assert_equal neighbours, grid.neighbours(3, 3)
  end

  def test_randomize_method
    grid_setup = Grid.setup!(2, 3)

    grid_setup.each do |row|
      assert row.none? { |col| col > 1 }
    end
  end

  def test_setup_class_method
    grid_setup = Grid.setup!(6, 7)

    assert_equal 6, grid_setup.length
    assert_equal 7, grid_setup[0].length
  end

  private

  def grid
    @grid ||= Grid.new(8, 9)
  end
end
