class IdenticalLines < Strategy
  def apply_to(lines)
    action_made = false
    full_lines = lines.select { |line| full?(line) }
    lines.each do |line|
      str = line.join
      next unless str.count(".") == 2
      s1, s2 = matches(str, ".")[:starts]
      full_lines.each do |full_line|
        if equal_off_empties?(line, full_line)
          line[s1] = full_line[s2]
          line[s2] = full_line[s1]
          action_made = true
        end
      end
    end
    action_made
  end

  def full?(line)
    !line.include?(".")
  end

  def equal_off_empties?(line1, line2)
    line1.zip(line2).all? {|a,b| a == "." ? true : a == b}
  end
end
