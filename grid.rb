class Grid
  def initialize(rows, cols)
    @cols = cols
    @rows = rows
  end

  attr_reader :cols, :rows

  def setup
    (1..rows).map do
      Array.new cols, 0
    end
  end

  class << self
    def setup!(rows, cols)
      new(rows, cols).setup
    end
  end
end
