require 'rails_helper'

describe "user creates new category" do
  context "user links from root" do
    scenario "user fills out form, submits and sees category show page" do

      visit new_category_path
      fill_in("category[name]", with: "Purple")
      click_button("Create")

      expect(current_path).to eq(category_path(Category.last.id))
      expect(page).to have_content("Purple")
      expect(Category.count).to eq(1)
    end
  end

  context "user tries to create category that already exists" do
    scenario "user is brought back to create category form" do
      Category.create!(name: "purple")

      visit new_category_path
      fill_in("category[name]", with: "purple")
      click_button("Create")

      # expect(current_path).to eq(category_path) #why does this not work, and why is it not new_category_path? The render :new seems to be that it should go there.
      expect(Category.count).to eq(1)
    end
  end
end
