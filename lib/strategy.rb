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
  def apply_to lines
    raise "Implement in subclass."
  end

  def neg
    {"0" => "1", "1" => "0"}
  end

  def matches(str, sub_str)
    starts = []
    i = str.index(sub_str)
    until i.nil?
      starts << i
      i = str.index(sub_str, i + sub_str.length)
    end
    {
      sub_str: sub_str,
      starts: starts,
      found: starts.any?
    }
  end
end
