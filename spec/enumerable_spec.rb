require_relative '../enumerable.rb'

describe Enumerable do
let(:array) { [1, 2, 3, 4, 5] }
let(:hs) { [ one: 1, two: 2, three: 3, four: 4, five: 5 ] }
let(:rg) { ( 1..5 ) }

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

end 
