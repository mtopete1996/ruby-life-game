class Grid
  def initialize(rows, cols)
    @cols = cols
    @rows = rows
  end

  attr_reader :cols, :rows

  def object
    @object ||= (1..rows).map do
      Array.new cols, 0
    end
  end

  def randomize
    object.each do |row|
      row.each_index do |c_index|
        row[c_index] = rand(2)
      end
    end
  end

  class << self
    def setup!(rows, cols)
      grid = new(rows, cols).randomize
    end
  end
end
