require 'rails_helper'

describe "As a user" do
  context "when I visit a companies page" do
    it "I can create a new job" do
      company = Company.create!(name: "Real Company")

      visit company_path(company)

      click_link "Add Job"

      expect(current_path).to eq(new_company_job_path(company))
    end
  end
end
