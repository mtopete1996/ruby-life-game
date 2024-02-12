# frozen_string_literal: true

class Grid
  # ROWS and COLS start at 0 and end at ROWS & COLS
  ROWS = 5
  COLS = 5

  class << self
    def init
      new.object
    end
  end

  def object
    @object ||= Populator.call
  end
end
