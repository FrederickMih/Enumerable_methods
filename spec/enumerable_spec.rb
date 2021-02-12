require_relative '../enumerable.rb'

describe Enumerable do
let(:arr) { [1, 2, 3, 4, 5] }
let(:hs) { [ one: 1, two: 2, three: 3, four: 4, five: 5 ] }
let(:rg) { (1..5 ) }

describe "#my_each" do
    it "returns the array of numbers" do
      expect(arr.my_each { |n| n } ).to eql(arr)
    end

    it "returns the hash table itself" do 
      expect(hs.my_each { |k, _v| k }).to eql(hs)
    end
    
end

end 
