class Array
  def transpose!
    arr = self
    n = size - 1
    0.upto(n) do |i|
      0.upto(i) do |j|
        arr[i][j], arr[j][i] = arr[j][i], arr[i][j]
      end
    end
    arr
  end
end
