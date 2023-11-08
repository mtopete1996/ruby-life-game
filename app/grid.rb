# frozen_string_literal: true

class Grid
  # ROWS and COLS start at 0
  ROWS = 5
  COLS = 5

  def object
    @object ||= Populator.call
  end
end
