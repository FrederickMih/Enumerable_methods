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

  #   my_count method

  def my_count(num = nil)
    count = 0
    if num
      my_each { |elem| count += 1 if elem == num }
    elsif block_given?
      my_each { |elem| count += 1 if yield(elem) }
    else
      count = length
    end
    count
  end

  #   my_map method

  def my_map(block = nil)
    arr = []
    if block
      my_each_with_index { |elem, index| arr[index] = block.call(elem) }
    else
      my_each_with_index { |elem, index| arr[index] = yield(elem) }
    end

    arr
  end

  # my_inject method

  def my_inject(initial = nil)
    result = initial.nil? ? self[0] : initial

    (1..length - 1).each do |i|
      result = yield(result, self[i])
    end
    result
  end
end

# testing my methods

# [4, 8, 5].my_each do |i|
#   puts i
# end

# [4, 8, 5].my_each_with_index do |i, index|
#   puts "#{i} at index #{index}"
# end

# [4, 8, 5].my_select do |i|
#   puts i if i > 4
# end

# puts([4, 8, 5].my_all? { |i| i > 2 })
# puts([4, 8, 5].my_any? { |i| i == 2 })
# puts([4, 8, 5].my_none? { |i| i == 4 })
# puts([4, 8, 5].my_count { |i| i == 4 })
# puts([4, 8, 5].my_count { |i| i > 4 })
# puts([4, 8, 5].my_map { |num| num * 10 })
test_block = proc { |elem| elem * 10 }
puts [4, 8, 5].my_map(&test_block)
puts([4, 8, 5].my_inject { |result, elem| result + elem })
def multiply_els(arr)
  arr.my_inject { |result, elem| result * elem }
end
puts multiply_els [2, 4, 5]
