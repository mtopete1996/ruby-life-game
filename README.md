# The Game of Life
**Author:** Manuel E. Topete Ortega

---

Ruby version: 2.7.2

MiniTest: 5.8.4

RubyCritic 4.6.0

Rubocop: 1.8.1

---

# What is it?
The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, alive or dead.
Every cell interacts with its eight neighbors, which are the cells that are directly horizontally, vertically, or diagonally adjacent.

At each step in time, the following transitions occur:
- Any living cell with fewer than two live neighbours dies, as if caused by underpopulation.
- Any living cell with more than three live neighbours dies, as if by overcrowding.
- Any living cell with two or three live neighbours lives on to the next generation.
- Any dead cell with exactly three live neighbours becomes a live cell.

The initial pattern constitutes the seed of the system.

The first generation is created by applying the above rules simultaneously to every cell in the seed: births and deaths happen simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the one before).

The rules continue to be applied repeatedly to create further generations.

# Running the game
To start the game just issue the command:
`ruby life_game.rb`

It will start to print the grid of cells and update automatically every 1.5 seconds.

The game will end when all cells are dead or you can interrupt it by pressing `ctrl + c`


# Running tests:
To run all tests issue the command:
```
for file in tests/*_test.rb; do
  ruby -Ilib:test $file
done
```

To test a specific file: `ruby -Ilib:test tests/<test-file-name>`
