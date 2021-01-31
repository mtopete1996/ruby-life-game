require 'minitest/autorun'
require_relative '../app/app'

class TestApp < Minitest::Test
  def test_grid_object_is_right_size
    assert_equal 12, app.grid.object.length
    assert_equal 14, app.grid.object[0].length
  end

  private

  def app
    @app ||= App.new(12, 14)
  end
end
