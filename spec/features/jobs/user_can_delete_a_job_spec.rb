require 'rails_helper'

describe "As a user" do
  context "when I arrive to the company jobs path" do
    it "I can delete a job" do
      company = Company.create!(name: "A Company")
      category = Category.create!(title: "Category")
      job = Job.create!(title: "Job1", description: "Jobby Job", level_of_interest: 2, city: "City", company: company, category: category)

      visit company_jobs_path(company)

      click_link "Delete Job"

      expect(current_path).to eq company_jobs_path(company)
      expect(company.jobs.count).to eq 0
    end
  end
end
