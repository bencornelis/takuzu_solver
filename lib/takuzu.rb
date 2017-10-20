class Takuzu
  def self.build(str)
    grid = str.strip.split("\n").map { |line| line.strip.split(/\s+/) }
    new(grid)
  end

  attr_reader :grid

  def initialize(grid)
    @grid = grid
    validate!
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
      action_made = strategies.map(&:execute).any?
    end
  end

  def strategies
    Strategy.types.map { |klass| klass.new(grid) }
  end

  def validate!
    unless valid_size?
      raise ArgumentError, 'Input must be a square grid'
    end

    unless valid_marks?
      raise ArgumentError, 'Grid must only contain ., 1, and 0'
    end
  end

  def valid_size?
    grid.any? && grid.size == grid.first.size
  end

  def valid_marks?
    valid_marks = %w(0 1 .)
    grid.flatten.all? { |mark| valid_marks.include?(mark) }
  end
end
