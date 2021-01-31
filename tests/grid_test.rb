require 'minitest/autorun'
require_relative './support/hardcode_grid_support'
require '../grid'

class TestGrid < Minitest::Test
  include HardcodeGridSupport

  def test_initialize_with_valid_args
    refute_nil grid
    assert_equal 8, grid.rows
    assert_equal 9, grid.cols
    assert_equal 8, grid.object.length
    assert_equal 9, grid.object[0].length
    assert_equal 9, grid.object[1].length

    assert_equal({ row: 0, col: 0 }, grid.object[0][0].position)
    assert_equal({ row: 1, col: 1 }, grid.object[1][1].position)
  end

  def test_initialize_with_invalid_args
    assert_raises(ArgumentError) { grid(-1, -4) }
  end

  def test_initialize_with_predefined_object
    refute_nil grid(3, 3, hardcode_grid)
    assert grid.assign_self_to_cells!
    assert_equal hardcode_grid, grid.object
  end

  def test_grid_object_is_right_size
    assert_equal 8, grid.rows
    assert_equal 9, grid.cols

    assert_equal 8, grid.object.length
    assert_equal 9, grid.object[0].length
  end

  def test_randomize_method
    grid_setup = Grid.setup!(3, 3)

    grid_setup.each do |row|
      assert row.all? { |col| col.instance_of?(Cell) }, 'All values should be a Cell instance'
    end
  end

  def test_setup_class_method
    grid_setup = Grid.setup!(6, 7)

    assert_equal 6, grid_setup.length
    assert_equal 7, grid_setup[0].length
  end

  def test_random_state_method
    assert grid.send :random_state, grid.object[2][3]
    assert Cell::STATES.include?(grid.object[2][3].state)
  end

  private

  def grid(rows = 8, cols = 9, obj = nil)
    @grid ||= Grid.new(rows, cols, obj)
  end
end
