require 'rails_helper'

describe "user deletes a category" do
  context "user clicks delete for a category" do
    scenario "sees index page with all categories excpet deleted" do
      category_1 = Category.create(name: "purple")
      Category.create(name: "pink")

      visit categories_path
      within(".category_#{category_1.id}") do
        click_link "Delete"
      end

      expect(current_path).to eq(categories_path)
      expect(page).to have_content("pink")
      expect(page).to_not have_content("purple")
    end
  end
end
