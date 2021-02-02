require_relative '../app/logger'

module RenderSupport
  def log
    logger.print_grid
  end

  def randomize
    loop_object do |cell|
      random_state(cell)
    end
  end

  private

  def logger
    @logger ||= Logger.new(self)
  end

  def loop_object(&block)
    object.each do |row|
      row.each do |cell|
        block.call(cell)
      end
    end
  end

  def random_state(cell)
    return cell.alive if rand(2) == 1

    cell.dead
  end
end
