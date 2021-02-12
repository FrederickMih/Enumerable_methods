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

   it "returns false if all elements are falsy" do 
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





end 
