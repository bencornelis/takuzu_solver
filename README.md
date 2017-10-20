### Takuzu Solver

A ruby program for solving [takuzu](https://en.wikipedia.org/wiki/Takuzu) puzzles.
You can try takuzu out [here](http://0hh1.com/).

Instead of brute force and backtracking, this program attempts to obtain the solution step by step, like a human. Because of this, it will not work on puzzles with multiple solutions.

It continuously applies three strategies (contained in `lib/strategy`) based on the rules:

* `MatchingCounts`:
  * each row and column should contain an equal number of 0s and 1s
  * e.g. 1xx101 can be filled in as 100101
* `ThreeInARow`:
  * more than two of the same number can't be adjacent
  * e.g. 00xxxx can be filled in as 001xxx and 1x1xxx as 101xxx
* `IdenticalLines`:
  * each row and column is unique
  * e.g. given rows 100101 and 1001xx, the second can be filled in as 100110

When applying all strategies successively to all rows and columns does not change the grid, it stops and prints the filled in grid.

### Solving Puzzles

Empty spaces are represented with periods.

```ruby
grid = %(
1 0 . 0
. . . 0
1 . . .
. . . 1
)

Takuzu.build(grid).solve

1 0 1 0
0 1 1 0
1 0 0 1
0 1 0 1
```