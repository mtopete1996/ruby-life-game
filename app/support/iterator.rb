# frozen_string_literal: true

module Support
  class Iterator
    class << self
      def each
        (0..Grid::ROWS).each do |y|
          (0..Grid::COLS).each do |x|
            yield(x, y)
          end
        end
      end

      def map
        (0..Grid::ROWS).map do |y|
          (0..Grid::COLS).map do |x|
            yield(x, y)
          end
        end
      end
    end
  end
end
