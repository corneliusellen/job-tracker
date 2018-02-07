require 'rails_helper'

describe "user edits a category" do
  context "user links to form from index page" do
    scenario "fills out form, submits form and sees category's updated information" do
      category = Category.create(name: "purple")

      visit edit_category_path(category)
      fill_in("category[name]", with: "black")
      click_button "Update"

      expect(current_path).to eq(category_path(category))
      expect(page).to have_content("black")
      expect(page).to_not have_content("purple")
    end
  end
end
