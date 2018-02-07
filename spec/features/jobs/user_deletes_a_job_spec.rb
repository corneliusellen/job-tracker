require 'rails_helper'

describe "user deletes a job" do
  scenario "user hits deletes and job is not longer on jobs index page" do
    category = Category.create!(name: "purple")
    company = Company.create!(name: "hey")
    job = Job.create!(title: "Mascot", description: "Dress up as a panda and wave at people!", level_of_interest: 50, city: "Muskegon", company_id: company.id, category_id: category.id)

    visit company_jobs_path(company)

    within(".job_#{job.id}") do
      click_link "Delete"
    end

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to_not have_content(job.description)
  end
end
