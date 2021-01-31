require_relative '../../app/cell'

module HardcodeGridSupport
  def hardcode_grid
    @hardcode_grid ||= [
      [new_cell(:alive, 0, 0), new_cell(:dead, 0, 1), new_cell(:dead, 0, 2)],
      [new_cell(:dead, 1, 0), new_cell(:dead, 1, 1), new_cell(:alive, 1, 2)],
      [new_cell(:dead, 2, 0), new_cell(:dead, 2, 1), new_cell(:dead, 2, 2)]
    ]
  end

  private

  def new_cell(state, row, col)
    Cell.new(state: state, position: { row: row, col: col })
  end
end
