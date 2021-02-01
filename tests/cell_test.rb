require 'minitest/autorun'
require_relative './support/hardcode_grid_support'
require_relative '../app/grid'
require_relative '../app/cell'

class TestCell < Minitest::Test
  include HardcodeGridSupport

  def test_is_alive_method
    assert alive_cell.alive?, 'Cell should be alive'
  end

  def test_is_dead_method
    assert dead_cell.dead?, 'Cell should be dead'
  end

  def test_kill_method
    assert_equal :dead, alive_cell.dead!
    assert alive_cell.dead?, 'Cell should be dead'
  end

  def test_revive_method
    assert_equal :alive, dead_cell.alive!
    assert dead_cell.alive?, 'Cell should be alive'
  end

  def test_state_as_number_method
    assert_equal 0, dead_cell.state_as_number
    assert_equal 1, alive_cell.state_as_number
  end

  def test_assign_position_with_valid_arguments_method
    position = { row: 2, col: 3 }
    assert_equal(position, alive_cell.send(:assign_position, position))
  end

  def test_assign_position_with_invalid_arguments_method
    assert_raises(ArgumentError) do
      alive_cell.send :assign_position
      assert_nil alive_cell.send :assign_position, { row: -2, col: -4 }
    end
  end

  def test_assign_grid_with_valid_grid
    alive_cell.grid = grid
    assert_equal grid, alive_cell.grid
  end

  def test_assign_grid_with_invalid_grid
    alive_cell.grid = :foo
    assert_nil alive_cell.grid
  end

  def test_cell_has_to_die_method
    grid = Grid.new(3, 3, hardcode_grid)
    alive_cell(grid)
    refute alive_cell.to_die?, 'Cell has to die'
  end

  private

  def alive_cell(grid_object = nil)
    @alive_cell ||= Cell.new state: :alive, position: { row: 1, col: 1 }, grid: grid_object
  end

  def dead_cell
    @dead_cell ||= Cell.new position: { row: 2, col: 2 }, grid: grid
  end

  def grid
    @grid ||= Grid.new(8, 9)
  end
end
