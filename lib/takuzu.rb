class Takuzu
  def self.from_string(str)
    grid = str.split("\n").map { |s| s.split("") }
    new(grid)
  end

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

  attr_reader :grid

  def execute_strategies
    action_made = true
    until action_made == false
      strategies = create_strategies
      all_actions = strategies.map { |strategy| strategy.execute }
      action_made = all_actions.any?
    end
  end

  def create_strategies
    Strategy.types.map { |klass| klass.new(grid) }
  end
end
