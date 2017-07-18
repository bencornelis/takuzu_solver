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
    execute_strategies
    display
  end

  def display
    puts grid.map { |row| row.join(" ") }.join("\n")
  end

  private

  def execute_strategies
    action_made = true
    while action_made
      strategies = create_strategies
      all_actions = strategies.map { |strategy| strategy.execute }
      action_made = all_actions.any?
    end
  end

  def create_strategies
    Strategy.types.map { |klass| klass.new(grid) }
  end
end
