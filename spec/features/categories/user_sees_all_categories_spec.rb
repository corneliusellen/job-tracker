require 'rails_helper'

describe "user can see all categories" do
  context "user links from root page" do
    scenario "user sees all categories" do
      Category.create!(name: "purple")
      Category.create!(name: "pink")
      Category.create!(name: "black")

      visit categories_path

      expect(page).to have_content("purple")
      expect(page).to have_content("pink")
      expect(page).to have_content("black")
    end
  end
end
