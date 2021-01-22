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

  #   my_all method
  def my_all?
    b = *self
    b.my_each do |i|
      return false if yield(i) == false
    end
    true
  end

  #  my_any

  def my_any?
    b = *self
    b.my_each do |i|
      return true if yield(i) == true
    end
    false
  end

  #  my_none method

  def my_none?
    b = *self
    b.my_each do |i|
      return false if yield(i) == true
    end
    true
  end

  # testing my methods

  [4, 8, 5].my_each do |i|
    puts i
  end

  [4, 8, 5].my_each_with_index do |i, index|
    puts "#{i} at index #{index}"
  end

  [4, 8, 5].my_select do |i|
    puts i if i > 4
  end

  puts([4, 8, 5].my_all? { |i| i > 2 })
  puts([4, 8, 5].my_any? { |i| i == 2 })
  puts([4, 8, 5].my_none? { |i| i == 4 })
end
