require 'rails_helper'

describe "user edits an existing job" do
  context "user links from company's jobs page" do
    scenario "user sees form with prefilled inputs containing current job's info" do
      company = Company.create!(name: "hey")
      job = Job.create!(title: "Mascot", description: "Dress up as a panda and wave at people!", level_of_interest: 50, city: "Muskegon", company_id: company.id)

      visit company_jobs_path(company)
      click_link "Edit"

      expect(current_path).to eq(edit_company_job_path(company, job))
      expect(page).to have_content("Edit #{job.title} job here:")
      expect(page).to have_content(job.title)
    end

    scenario "user fills in form, submits form, and sees job's show page with updated information" do
      company = Company.create!(name: "hey")
      job = Job.create!(title: "Mascot", description: "Dress up as a panda and wave at people!", level_of_interest: 50, city: "Muskegon", company_id: company.id)
      new_title = "Special Company Representative"

      visit edit_company_job_path(company, job)

      fill_in("job[title]", with: new_title)
      click_button "Update"

      expect(current_path).to eq(company_job_path(company, job))
      expect(page).to have_content(new_title)
      expect(page).to_not have_content("mascot")
      expect(page).to have_content(job.description)
      expect(page).to have_content(job.level_of_interest)
      expect(page).to have_content(job.city)
      end
    end
  end
