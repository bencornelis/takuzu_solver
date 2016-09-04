class TwoInARow < Strategy
  def apply_to(lines)
    action_made = false
    lines.each do |line|
      str = line.join
      all_matches = [
        matches(str, ".11"),
        matches(str, "11."),
        matches(str, ".00"),
        matches(str, "00."),
      ].select { |matches| matches[:found] }

      if all_matches.any?
        all_matches.each do |matches_for_exp|
          exp = matches_for_exp[:sub_str]
          fill = neg[exp[1]]
          matches_for_exp[:starts].each do |start_idx|
            idx = start_idx + exp.index(".")
            line[idx] = fill
          end
        end
        action_made = true
      end
    end
    action_made
  end
end
