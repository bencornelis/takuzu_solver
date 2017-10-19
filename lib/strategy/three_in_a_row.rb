class ThreeInARow < Strategy
  def apply_to(lines)
    action_made = false
    lines.each do |line|
      all_pattern_matches(line).each do |match|
        exp  = match[0]
        fill = opp[exp.scan(/[01]/)[0]]
        idx  = match.begin(0) + exp.index(".")
        line[idx] = fill
        action_made = true
      end
    end
    action_made
  end

  def all_pattern_matches(line)
    patterns.map { |regex|
      line.join.matches(regex) }.flatten
  end

  def patterns
    [/11\./, /\.11/, /00\./, /\.00/, /1\.1/, /0\.0/]
  end

  def opp
    {"0" => "1", "1" => "0"}
  end
end
