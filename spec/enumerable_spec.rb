require_relative '../enumerable.rb'

describe Enumerable do
let(:array) { [1, 2, 3, 4, 5] }
let(:hs) { [ one: 1, two: 2, three: 3, four: 4, five: 5 ] }
let(:rg) { ( 1...5 ) }

# describe "#my_each" do
#     it "returns the array of numbers" do
#       expect(array.my_each { |n| n } ).to eql(array)
#     end

#     it "returns the hash table " do 
#       expect(hs.my_each { |k, _v| k }).to eql(hs)
#     end

#     it "returns the range of numbers" do
#       expect(rg.my_each { |nbers| nbers }).to eql(rg)
#     end

#     it "returns an enumerable if no block is given" do
#       expect(array.my_each.is_a?(Enumerable)).to eql(true)
#     end 
    
# end

# describe "#my_each_with_index" do
#    it "returns the array of numbers" do
#       expect(array.my_each_with_index { |n, i| n }).to eql(array)
#    end

#    it "returns the hash" do 
#       expect(hs.my_each_with_index { |k, v, i| k }).to eql(hs)
#    end

#    it "returns range of numbers" do
#       expect(rg.my_each_with_index { |nbers, i| nbers }).to eql(rg)
#    end

#    it "returns enumerable if no block is given" do
#       expect(array.my_each_with_index.is_a? (Enumerable)).to eql(true)
#    end
# end

# describe '#my_select' do
#    it "returns an array with the selected numbers given in the block" do
#       expect(array.my_select { |num| num < 3 }).to eql([1, 2])
#    end
   
#    it "returns an empty array if the elements are false in the block" do
#       expect(array.my_select { |n| n > 5 }).to eql([])
#    end
   
#    it "return an enumerator if no block is given" do
#       expect(array.my_select.is_a?(Enumerable)).to eql(true)
#    end

#    it "returns an array with strings that are true to the given block" do
#       expect(["f", "r", "e", "d"].my_select { |n| n }).to eql(["r"])
#    end

# end

# describe "my_all?" do
#    it "returns true if all elements are true" do
#       expect(array.my_all?).to eql(true)
#    end

#    it "returns true if all elements are of the same class" do 
#       expect(array.my_all?(Integer)).to eql(true)
#    end

#    it "returns false if one of the element in the block is false" do
#       expect([1, 2, false].my_all?).to eql(false)
#    end

#    it "returns true if all elements are equal to  a given array" do
#       expect([2, 2, 2, 2, 2, 2, 2].my_all?(2)).to eql(true)
#    end
   
#    it "returns true if all the elements comply with a given block" do
#       expect(array.my_all? { |num| num < 10 }).to eql(true)
#    end
    
#    it "returns true if all the elements contain a given regex" do
#       expect(["how", "hello", "common"].my_all?(/o/)).to eql(true)
#    end
# end

describe '#my_any' do

   it "returns false if one of the elements is true" do
      expect(array.my_any?).to eql(true)
   end

   it "returns false if all elements are false" do 
      expect([false, nil, false].my_any?).to eql(false)
   end

   it "returns true if one of the elements are of the same class" do 
      expect(array.my_any?(Integer)).to eql(true)
   end

    it "returns true if one of the elements contain a given regex" do
      expect(["how", "hello", "commn"].my_any?(/o/)).to eql(true)
   end

   it "returns true if one of the elements are equal to  a given argument" do
      expect([2, 4, 3, 1, 1, 1, 1].my_any?(2)).to eql(true)
   end

    it "returns true if one of  the elements comply with a given block" do
      expect(array.my_any? { |num| num < 10 }).to eql(true)
   end
end

describe "#my_none" do
   it "returns false if no elements is true" do
      expect(array.my_none?).to eql(false)
   end

   it "returns true if no elements are true" do 
      expect([false, nil, false].my_none?).to eql(true)
   end

   it "returns false if no element is of the same class" do 
      expect(array.my_none?(Integer)).to eql(false)
   end

   it "returns true if none of them contain a given regex" do
      expect(["hw", "hell", "cmmn"].my_none?(/o/)).to eql(true)
   end

   it "returns true if none of the elements are equal to a given argument" do
      expect([2, 4, 3, 1, 1, 1, 1].my_none?(10)).to eql(true)
   end

   it "returns false if none of  the elements comply with a given block" do
      expect(array.my_none? { |num| num < 10 }).to eql(false)
   end
  
end

describe '#my_count' do
   it "counts the elements that are equal to the given parameter" do
      expect([2, 3, 4, 5, 6, 2, 2, 2, 7].my_count(2)).to eql(4)
   end

   it " returns 0 if no elements are true in the block" do
      expect(array.my_count { |n| n > 6 }).to eql(0)
   end

   it "counts the elements that are true in the block" do
      expect(array.my_count { |n| n > 2 }).to eql(3)
   end

   it "counts the element of an array if no block is given" do
      expect(array.my_count).to eql(5)
end

describe "#my_map" do
   it "iterates through a range and returns the modified values" do
      expect(rg.my_map { |nber| nber - 1 }).to eql([0, 1, 2, 3, 4])
   end
   it "returns an enumerator if no block is given" do
      expect(array.my_map.is_a?)(Enumerable).to eql(true)
   end
end

describe "#my_inject" do
   it "returns the result of a mathematical expression passed to the argument" do
      expect((1...5).my_inject(:+)).to eql(4)
   end

    it "returns the result of a mathematical expression passed to the argument" do
      expect(array.my_inject(:*)).to eql(120)
   end

   it "returns the result of a mathematical expression passed to the argument" do
      expect((1...5).my_inject(20, :+)).to eql(24)
   end

   it "returns the result of a mathematical expression passed as a block" do
      expect((1...5).my_inject {|i, num| i + num }).to eql(15)
   end

   it "returns the result of a mathematical expression passed as a block while using an acculator" do
      expect((1...5).my_inject(20) {|i, num| i + num }).to eql(35)
   end

    it "returns the the longest string" do
      expect(["Mih", "Frederick", "ngum"].my_inject{|acc, str| acc.length > word.length ? acc : word } ).to eql(Frederick)
   end
    
   it "raises a localJump error if no block or symbol is given" do
      expect {array.my_inject}.to raise_error(LocalJumpError)
   end



    





end 
