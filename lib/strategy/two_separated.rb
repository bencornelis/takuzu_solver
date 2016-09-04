class TwoSeparated < Strategy
  def apply_to(lines)
    action_made = false
    lines.each do |line|
      str = line.join
      all_matches = [
        matches(str, "1.1"),
        matches(str, "0.0"),
      ].select { |matches| matches[:found] }

      if all_matches.any?
        all_matches.each do |matches_for_exp|
          exp = matches_for_exp[:sub_str]
          fill = neg[exp[0]]
          matches_for_exp[:starts].each do |start_idx|
            idx = start_idx + 1
            line[idx] = fill
          end
        end
        action_made = true
      end
    end
    action_made
  end
end
