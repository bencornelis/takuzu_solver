class IdenticalLines < Strategy
  def apply_to_rows
    action_made = false
    full_rows = grid.select { |row| full?(row) }
    grid.each do |row|
      next unless row.count(".") == 2
      s1, s2 = empty_indices(row)
      full_rows.each do |full_row|
        if equal_off_empties?(row, full_row)
          row[s1], row[s2] = full_row[s2], full_row[s1]
          action_made = true
        end
      end
    end
    action_made
  end

  def empty_indices(row)
    row.join.matches(/\./).map { |match| match.begin(0) }
  end

  def full?(row)
    !row.include?(".")
  end

  def equal_off_empties?(row1, row2)
    row1.zip(row2).all? { |a,b| a == "." ? true : a == b }
  end
end
