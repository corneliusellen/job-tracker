require 'rails_helper'

describe "user sees one category" do
  scenario "user sees all jobs associated with category" do
    category_1 = Category.create!(name: "purple")
    category_2 = Category.create!(name: "pink")
    company = Company.create!(name: "ESPN")
    job_1 = Job.create!(title: "Mascot", description: "Dress up as a panda and wave at people!", level_of_interest: 50, city: "Muskegon", company_id: company.id, category_id: category_1.id)
    job_2 = Job.create!(title: "Runner", description: "Dress up as a panda and wave at people!", level_of_interest: 50, city: "Muskegon", company_id: company.id, category_id: category_1.id)
    job_3 = Job.create!(title: "Businessman", description: "Dress up as a panda and wave at people!", level_of_interest: 50, city: "Muskegon", company_id: company.id, category_id: category_2.id)

    visit category_path(category_1)

    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_2.title)
    expect(page).to_not have_content(job_3.title)
  end
end
