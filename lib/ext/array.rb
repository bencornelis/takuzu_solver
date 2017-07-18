class Array
  def transpose!
    0.upto(size - 1) { |i|
      0.upto(i) { |j|
        self[i][j], self[j][i] = self[j][i], self[i][j] } }
    self
  end
end
