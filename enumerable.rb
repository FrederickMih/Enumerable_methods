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

  # my_each_with_index

  def my_each_with_index
    b = *self
    i = 0
    until i == b.size
      yield(b[i], i)
      i += 1
    end
    self
  end
end
# testing my methods
[2, 4, 5].my_each do |i|
  puts i
end
[2, 4, 5].my_each_with_index do |i, index|
  puts "#{i} at index #{index}"
end
