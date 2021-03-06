require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:cherry_pie) { Dessert.new("cherry pie", 25, chef) }

  describe "#initialize" do

    it "sets a type" do
      expect(cherry_pie.type).to eq("cherry pie")
    end

    it "sets a quantity" do
      expect(cherry_pie.quantity).to eq(25)
    end

    it "starts ingredients as an empty array" do
      expect(cherry_pie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cherry pie", "I ate it", chef)}.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do

    it "adds an ingredient to the ingredients array" do
      cherry_pie.add_ingredient("cherries")
      expect(cherry_pie.ingredients).to include("cherries")
    end

  end

  describe "#mix!" do

    it "shuffles the ingredient array" do
      @ingredients = ["cherries", "cornstarch", "pie crust", "sugar", ]
      cherry_pie.mix!
      expect(cherry_pie.ingredients).not_to eq(@ingredients)
  end

end

  describe "#eat" do

    it "subtracts an amount from the quantity" do
      cherry_pie.eat(5)
      expect(cherry_pie.quantity).to eq(20)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {cherry_pie.eat(100)}.to raise_error("not enough left!")
    end

  end

  describe "#serve" do

    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Swede the Great Baker")
      expect(cherry_pie.serve).to eq("Chef Swede the Great Baker has made 25 cherry pies!")
    end

  end

  describe "#make_more" do

    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cherry_pie)
      cherry_pie.make_more
    end

  end
  
end
