require 'rails_helper'

describe Category do
  describe "validations" do
    describe "invalid attributes" do
      it "it invalid without a name" do
        category = Category.new()

        expect(category).to be_invalid
      end

      it "it had a unique name" do
        Category.create(name: "purple")
        category_2 = Category.new(name: "purple")

        expect(category_2).to be_invalid
      end
    end
  end
end
