require 'rails_helper'

describe "When user is on show page" do
  it "user can see comment form" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "cat")
    job = Job.create!(title: "Job1", description: "Jobby Job", level_of_interest: 2, city: "City", company: company, category: category)
    visit company_job_path(company, job)

    expect(page).to have_content "Comments"

    fill_in "job[comment]", with: "This is a test"
    click_on "Submit Comment"

    expect(current_path).to eq company_job_path(company, job)
    expect(page).to have_content "This is a test"
  end
end
