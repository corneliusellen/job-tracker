require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end
  end

  describe "Class methods" do
    describe ".top_three_by_interest" do
      category = Category.create!(name: "software")
      company_1 = Company.create!(name: "Dropbox")
      company_2 = Company.create!(name: "Microsoft")
      company_3 = Company.create!(name: "Snapchat")
      job_1 = Job.create!(title: "Software Developer", description: "Dress up as a panda and wave at people!", level_of_interest: 10, city: "Seattle", company_id: company_1.id, category_id: category.id)
      job_2 = Job.create!(title: "Scrum Master", description: "Dress up as a panda and wave at people!", level_of_interest: 10, city: "Muskegon", company_id: company_1.id, category_id: category.id)
      job_3 = Job.create!(title: "Mascot", description: "Dress up as a panda and wave at people!", level_of_interest: 60, city: "Denver", company_id: company_2.id, category_id: category.id)
      job_4 = Job.create!(title: "Software Architect", description: "Dress up as a panda and wave at people!", level_of_interest: 40, city: "Tampa", company_id: company_2.id, category_id: category.id)
      job_5 = Job.create!(title: "Boss Man", description: "Dress up as a panda and wave at people!", level_of_interest: 90, city: "Raleigh", company_id: company_3.id, category_id: category.id)
      job_6 = Job.create!(title: "Boss Woman", description: "Dress up as a panda and wave at people!", level_of_interest: 90, city: "Fargo", company_id: company_3.id, category_id: category.id)

      expect(Company.top_three_by_interest.first).to eq(company_3)
      expect(Company.top_three_by_interest[1]).to eq(company_2)
      expect(Company.top_three_by_interest[2]).to eq(company_1)
    end
  end
end
