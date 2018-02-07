require 'rails_helper'

describe "User sees a specific job" do
  scenario "user sees a job for a specific company" do
    category = Category.create!(name: "purple")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end

  scenario "user sees comments for that job" do
    category = Category.create!(name: "purple")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    comment = job.comments.create(author: "Ellen", body: "This is chronic.")

    visit company_job_path(company, job)

    expect(page).to have_content(comment.author)
    expect(page).to have_content(comment.body)
  end

  scenario "user can enter comment for job" do
    category = Category.create!(name: "purple")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit company_job_path(company, job)
    fill_in "comment[author]", with: "Ellen"
    fill_in "comment[body]", with: "This is chronic."
    click_on "Submit"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Ellen")
    expect(page).to have_content("This is chronic.")
  end
end
