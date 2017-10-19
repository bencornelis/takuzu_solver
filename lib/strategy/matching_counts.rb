class MatchingCounts < Strategy
  def apply_to_rows
    action_made = false
    half_size = grid[0].size/2
    grid.each do |row|
      next unless row.include?(".")
      half_mark = %w(0 1).find { |mark| row.count(mark) == half_size }
      if half_mark
        fill = opp[half_mark]
        empty_indices(row).each { |idx| row[idx] = fill }
        action_made = true
      end
    end
    action_made
  end

  def empty_indices(row)
    row.join.matches(/\./).map { |match| match.begin(0) }
  end

  def opp
    {"0" => "1", "1" => "0"}
  end
end
