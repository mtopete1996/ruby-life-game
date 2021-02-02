module NeighbourHashSupport
  private

  def down_neighbours
    { down_left: [neighbours_hash[:next_row], neighbours_hash[:previous_col]],
      down: [neighbours_hash[:next_row], col],
      down_right: [neighbours_hash[:next_row], neighbours_hash[:next_col]] }
  end

  def lateral_neigbours
    {
      left: [row, neighbours_hash[:previous_col]],
      right: [row, neighbours_hash[:next_col]]
    }
  end

  def neighbours_hash
    @neighbours_hash ||= { previous_row: previous_row, next_row: next_row, previous_col: previous_col,
                           next_col: next_col }
  end

  def next_col
    next_r = col + 1
    next_r if next_r < cols
  end

  def next_row
    next_r = row + 1
    next_r if next_r < rows
  end

  def previous_col
    previous = col - 1
    previous if previous >= 0
  end

  def previous_row
    previous = row - 1
    previous if previous >= 0
  end

  def up_neighbours
    { up_left: [neighbours_hash[:previous_row], neighbours_hash[:previous_col]],
      up: [neighbours_hash[:previous_row], col],
      up_right: [neighbours_hash[:previous_row], neighbours_hash[:next_col]] }
  end
end
