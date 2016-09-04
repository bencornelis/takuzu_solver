class MatchingCounts < Strategy
  def apply_to(lines)
    action_made = false
    half_size = lines[0].size/2
    lines.each do |line|
      str = line.join
      next unless str.include?(".")
      ex_mark = %w(0 1).find { |mark| line.count(mark) == half_size }
      if ex_mark
        fill = neg[ex_mark]
        empty_indices = str.matches(".")[:starts]
        empty_indices.each { |idx| line[idx] = fill }
        action_made = true
      end
    end
    action_made
  end
end
