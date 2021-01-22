module Enumerable
  def my_each
    b = *self
    i = 0
    until i == b.size
      yield(b[i])
      i += 1
    end
    b
  end

  # my_each_with_index

  def my_each_with_index
    b = *self
    i = 0
    until i == b.size
      yield(b[i], i)
      i += 1
    end
    b
  end

  # my select

  def my_select
    b = *self
    arr = []
    b.my_each do |i|
      arr.push(i) if yield(i)
    end
    arr
  end
end

# testing my methods
[4, 8, 5].my_each do |i|
  puts i
end

[4, 8, 5].my_each_with_index do |i, index|
  puts "#{i} at index #{index}"
end

[4, 8, 5].my_select do |i|
  puts i if i.even?
end
