require_relative '../enumerable.rb'

describe Enumerable do
let(:array) { [1, 2, 3, 4, 5] }
let(:hs) { [ one: 1, two: 2, three: 3, four: 4, five: 5 ] }
let(:rg) { ( 1...5 ) }

describe "#my_each" do
    it "returns the array of numbers" do
      expect(array.my_each { |n| n } ).to eql(array)
    end

    it "returns the hash table " do 
      expect(hs.my_each { |k, _v| k }).to eql(hs)
    end

    it "returns the range of numbers" do
      expect(rg.my_each { |nbers| nbers }).to eql(rg)
    end

    it "returns an enumerable if no block is given" do
      expect(array.my_each.is_a?(Enumerable)).to eql(true)
    end 
    
end

describe "#my_each_with_index" do
   it "returns the array of numbers" do
      expect(array.my_each_with_index { |n, i| n }).to eql(array)
   end

   it "returns a hash" do 
      expect(hs.my_each_with_index { |k, v, i| k }).to eql(hs)
   end

   it "returns range of numbers" do
      expect(rg.my_each_with_index { |nbers, i| nbers }).to eql(rg)
   end

   it "returns enumerable if no block is given" do
      expect(array.my_each_with_index.is_a? (Enumerable)).to eql(true)
   end
end

describe '#my_select' do
   it "returns an array with the selected numbers given in the block" do
      expect(array.my_select { |num| num > 2 }).to eql([3, 4])
   end
   
   it "returns an empty array if the elements are false in the block" do
      expect(array.my_select { |n| n > 5 }).to eql([])
   end
end

end 
