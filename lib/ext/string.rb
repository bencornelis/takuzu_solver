class String
  def matches(sub_str)
    starts = []
    i = index(sub_str)
    until i.nil?
      starts << i
      i = index(sub_str, i + sub_str.length)
    end
    {
      sub_str: sub_str,
      starts:  starts,
      found:   starts.any?
    }
  end
end
