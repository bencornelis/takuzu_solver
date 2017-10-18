class Takuzu
  def self.build(str)
    grid = str.strip.split("\n").map { |line| line.strip.split(/\s+/) }
    new(grid)
  end

  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def solve
    puts fill_grid.map { |row| row.join(" ") }.join("\n")
  end

  private

  def fill_grid
    prev_grid, cur_grid = nil, grid
    until prev_grid == cur_grid
      prev_grid = cur_grid
      cur_grid = execute_strategies(cur_grid)
    end
    cur_grid
  end

  def execute_strategies(cur_grid)
    strategies.reduce(cur_grid) do |new_grid, strategy|
      strategy.execute(new_grid)
    end
  end

  def strategies
    @strategies ||= Strategy.types.map(&:new)
  end
end
