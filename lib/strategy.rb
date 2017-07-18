class Strategy
  def self.types
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def execute
    action_made = false
    2.times do
      @grid.transpose!
      action_made = apply_to(grid) || action_made
    end
    action_made
  end

  private
  def apply_to(lines)
    raise "Implement in subclass."
  end
end
