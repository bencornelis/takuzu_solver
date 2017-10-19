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
      changed_any_row = apply_to_rows
      action_made ||= changed_any_row
    end
    action_made
  end

  def apply_to_rows
    raise "Implement in subclass."
  end
end
