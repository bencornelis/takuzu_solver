### takuzu_solver

A ruby program for solving [takuzu](https://en.wikipedia.org/wiki/Takuzu) puzzles.
You can try takuzu out [here](http://0hh1.com/).

### Solving Puzzles

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
