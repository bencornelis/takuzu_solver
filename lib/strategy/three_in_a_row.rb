class ThreeInARow < Strategy
  def apply_to_rows(rows)
    rows.each do |row|
      all_matches(row).each do |match|
        exp  = match[0]
        fill = opp[exp.scan(/[01]/)[0]]
        idx  = match.begin(0) + exp.index(".")
        row[idx] = fill
      end
    end
    rows
  end

  def all_matches(row)
    patterns.map { |regex|
      row.join.matches(regex) }.flatten
  end

  def patterns
    [/11\./, /\.11/, /00\./, /\.00/, /1\.1/, /0\.0/]
  end

  def opp
    {"0" => "1", "1" => "0"}
  end
end
