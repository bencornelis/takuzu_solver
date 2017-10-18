class Strategy
  def self.types
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  def execute(grid)
    grid = grid.map(&:dup)
    grid = apply_to_rows(grid)
    apply_to_rows(grid.transpose).transpose
  end

  private

  def apply_to_rows(rows)
    raise "Implement in subclass."
  end
end
