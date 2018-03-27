require 'rails_helper'

describe "As a user" do
  context "when I arrive at the job show page" do
    it "I can edit a jobs name" do
      company = Company.create!(name: "Company name")
      job = Job.create!(title: "Its a job", description: "Jobby", level_of_interest: 99, city: "Mexico City", company_id: company.id)

      visit company_job_path(company, job)

      click_link "Edit Job"

      expect(current_path).to eq edit_company_job_path(company, job)
    end
  end
end
