module Enumerable
  def my_each
    b = *self
    i = 0
    until i == b.size
      yield(b[i])
      i += 1
    end
    self
  end
end
[2, 4, 5].my_each do |i|
  puts i
end
