require 'rails_helper'

describe "As a user" do
  context "when I visit a companies page" do
    it "I can create a new job" do
      company = Company.create!(name: "Real Company")
      Category.create!(title: "Category")
      Category.create!(title: "Category2")

      visit company_path(company)

      click_link "Add Job"

      expect(current_path).to eq(new_company_job_path(company))

      fill_in "job[title]", with: "Job1"
      fill_in "job[description]", with: "Its a Job!"
      fill_in "job[level_of_interest]", with: 90
      fill_in "job[city]", with: "Denver"
      find(:xpath, '//select[@id="job_category_id"]/option[2]').select_option

      click_on "Create Job"
      job = company.jobs.first
      expect(page).to have_content "You created Job1 at #{company.name}"
      expect(current_path).to eq company_job_path(company, job)
    end
    it "I can view a single job after its been created" do
      company = Company.create!(name: "Real Company")
      Category.create!(title: "Category")
      Category.create!(title: "Category2")

      visit company_path(company)

      click_link "Add Job"

      expect(current_path).to eq(new_company_job_path(company))

      fill_in "job[title]", with: "Job1"
      fill_in "job[description]", with: "Its a Job!"
      fill_in "job[level_of_interest]", with: 90
      fill_in "job[city]", with: "Denver"
      find(:xpath, '//select[@id="job_category_id"]/option[2]').select_option

      click_on "Create Job"
      job = company.jobs.first

      visit company_path(company)
      click_link job.title

      expect(current_path).to eq company_job_path(company, job)
      expect(page).to have_content "#{job.title}"
      expect(page).to have_content "#{job.description}"
      expect(page).to have_content "#{job.level_of_interest}"
      expect(page).to have_content "#{job.city}"
    end
  end
end
