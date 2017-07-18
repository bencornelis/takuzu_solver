class MatchingCounts < Strategy
  def apply_to(lines)
    action_made = false
    half_size = lines[0].size/2
    lines.each do |line|
      next unless line.include?(".")
      ex_mark = %w(0 1).find { |mark| line.count(mark) == half_size }
      if ex_mark
        fill = opp[ex_mark]
        empty_indices(line).each { |idx| line[idx] = fill }
        action_made = true
      end
    end
    action_made
  end

  def empty_indices(line)
    line.join.matches(/\./).map { |match| match.begin(0) }
  end

  def opp
    {"0" => "1", "1" => "0"}
  end
end
