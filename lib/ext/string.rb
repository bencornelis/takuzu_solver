class String
  def matches(regex)
    to_enum(:scan, regex).map { Regexp.last_match }
  end
end
