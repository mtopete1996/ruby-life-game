require 'minitest/autorun'
require '../grid'

class TestGrid < Minitest::Test
  def test_check_neighbours
    assert_equal [[0, 1, 1], [0, 0, 0], [0, 0, 0]], hardcode_grid.object
    assert_equal 2, hardcode_grid.check_neighbours(1, 1)
  end

  def test_grid_object_is_right_size
    assert_equal 8, grid.send(:rows)
    assert_equal 9, grid.send(:cols)

    assert_equal 8, grid.object.length
    assert_equal 9, grid.object[0].length
  end

  def test_neighbours_method
    neighbours = [[2, 2], [2, 3], [2, 4], [3, 2], [3, 4], [4, 2], [4, 3], [4, 4]]

    assert_equal neighbours, grid.send(:neighbours, 3, 3)
  end

  def test_randomize_method
    grid_setup = Grid.setup!(3, 3)

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

  def hardcode_grid
    obj = [[0, 1, 1], [0, 0, 0], [0, 0, 0]]
    Grid.new(3, 3, obj)
  end

  def grid
    @grid ||= Grid.new(8, 9)
  end
end
