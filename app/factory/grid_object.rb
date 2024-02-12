# frozen_string_literal: true

module Factory
  class GridObject
    STYLES = %i[random all_alive all_dead to_die to_live].freeze

    class << self
      def call(population_style: :random)
        validate_populator(population_style)
        send(population_style)
      end

      private

      def all_alive
        Support::Iterator.map { |x, y| Cell.new(coord_x: x, coord_y: y, state: Cell::ALIVE) }
      end

      def all_dead
        Support::Iterator.map { |x, y| Cell.new(coord_x: x, coord_y: y, state: Cell::DEAD) }
      end

      def random
        Support::Iterator.map { |x, y| Cell.new(coord_x: x, coord_y: y, state: Cell::STATES.sample) }
      end

      def to_die
        # Cell has to die because overpopulation (> 3 alive neighbours)
        # [
        #   [alive dead dead]
        #   [dead alive alive]
        #   [alive dead alive]
        # ]

        [
          [Cell.compact_new(0, 0), Cell.compact_new(0, 1, Cell::DEAD), Cell.compact_new(0, 2, Cell::DEAD)],
          [Cell.compact_new(1, 0, Cell::DEAD), Cell.compact_new(1, 1), Cell.compact_new(1, 2)],
          [Cell.compact_new(2, 0), Cell.compact_new(2, 1, Cell::DEAD), Cell.compact_new(2, 2)]
        ]
      end

      def to_live
        # Cell lives because has only 2 alive neighbours
        # [
        #   [alive dead dead]
        #   [dead alive dead]
        #   [alive dead dead]
        # ]
        [
          [Cell.compact_new(0, 0), Cell.compact_new(0, 1, Cell::DEAD), Cell.compact_new(0, 2, Cell::DEAD)],
          [Cell.compact_new(1, 0, Cell::DEAD), Cell.compact_new(1, 1), Cell.compact_new(1, 2, Cell::DEAD)],
          [Cell.compact_new(2, 0), Cell.compact_new(2, 1, Cell::DEAD), Cell.compact_new(2, 2), Cell::DEAD]
        ]
      end

      def to_revive
        # Cell revives because has exactly 3 alive neighbours
        # [
        #   [alive dead dead]
        #   [dead dead alive]
        #   [alive dead dead]
        # ]

        [
          [Cell.compact_new(0, 0), Cell.compact_new(0, 1, Cell::DEAD), Cell.compact_new(0, 2, Cell::DEAD)],
          [Cell.compact_new(1, 0, Cell::DEAD), Cell.compact_new(1, 1, Cell::DEAD), Cell.compact_new(1, 2)],
          [Cell.compact_new(2, 0), Cell.compact_new(2, 1, Cell::DEAD), Cell.compact_new(2, 2, Cell::DEAD)]
        ]
      end

      def validate_populator(population_style)
        raise ArgumentError, 'Invalid population style' unless STYLES.include?(population_style)
      end
    end
  end
end
