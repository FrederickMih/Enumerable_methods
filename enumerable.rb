# rubocop:enable Metrics/ModuleLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
module Enumerable
  def my_each
    b = *self
    return to_enum(:my_each) unless block_given?
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
    return to_enum(:my_each_with_index) unless block_given?
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
    return to_enum(:my_select) unless block_given?
    arr = []
    b.my_each do |i|
      arr.push(i) if yield(i)
    end
    arr
  end

  #   my_all method

  def my_all?(*param)
    j = 0
    b = *self
    n = b.length
    if param[0].is_a? Class
      n.times do
        return false unless b[j].is_a?(param[0])

        j += 1
      end
    elsif param[0].is_a? Regexp
      n.times do
        return false unless b[j] =~ param[0]

        j += 1
      end

    elsif param.size == 1
      n.times do
        return false unless b[j] == param[0]

        j += 1
      end

    elsif block_given?
      n.times do
        return false unless yield(b[j])

        j += 1
      end
    else
      n.times do
        return false unless b[j]

        j += 1
      end
    end
    true
  end

  #  my_any

  def my_any?(*param)
    j = 0
    b = *self
    n = b.length

    if param[0].is_a? Class
      n.times do
        return true if b[j].is_a?(param[0])

        j += 1
      end
    elsif param[0].is_a? Regexp
      n.times do
        return true if b[j] =~ param[0]

        j += 1
      end

    elsif param.size == 1
      n.times do
        return true if b[j] == param[0]

        j += 1
      end

    elsif block_given?
      n.times do
        return true if yield(b[j])

        j += 1
      end
    else
      n.times do
        return true if b[j]

        j += 1
      end
    end
    false
  end


#  my_none method

def my_none?(*param)
  j = 0
  b = *self
  n = b.length

  if param[0].is_a? Class
    n.times do
      return false if b[j].is_a?(param[0])

      j += 1
    end
  elsif param[0].is_a? Regexp
    n.times do
      return false if b[j] =~ param[0]

      j += 1
    end

  elsif param.size == 1
    n.times do
      return false if b[j] == param[0]

      j += 1
    end

  elsif block_given?
    n.times do
      return false if yield(b[j])

      j += 1
    end
  else
    n.times do
      return false if b[j]

      j += 1
    end
  end
  true
end

#   my_count method

def my_count(arg = nil)
    b = *self
    j = 0
    n = b.length
    count = 0
    if block_given?
      n.times do
        count += 1 if yield(b[j])
        j += 1
      end
      count
    else
      unless arg.nil?
          n.times do
          count += 1 if b[j] == arg
          j += 1
        end
        return count
      end
      n
    end
  end

#   my_map method

def my_map(block = nil)
  arr = []
  return to_enum(:my_map) unless block_given?
  if block
    my_each_with_index { |elem, index| arr[index] = block.call(elem) }
  else
    my_each_with_index { |elem, index| arr[index] = yield(elem) }
  end

  arr
end

# my_inject method

def my_inject(*param)
      j = 0
      b = *self
      n = b.length

  if param[0].is_a? Symbol
    pr = param[0].to_proc
    accu = b[0]
    j = 1
    (n- 1).times do
      accu = pr.call(accu, b[j])
      j += 1
    end
  elsif param[1].is_a? Symbol
    accu = param[0]
    pr = param[1].to_proc
    b.my_each do |element|
      accu = pr.call(accu, element)
    end
  elsif block_given?
    accu = param[0]
    b.my_each do |element|
      accu = !accu ? element : yield(accu, element)
    end
  else
    raise LocalJumpError unless block_given?
  end
  accu
end
end

def multiply_els(arr)
arr.my_inject { |result, elem| result * elem }
end
puts multiply_els [2, 4, 5]

# rubocop:enable Metrics/ModuleLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity


