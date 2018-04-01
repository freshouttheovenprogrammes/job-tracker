require 'rails_helper'

describe "As a user" do
  context "from a category show path" do
    it "I can see all related jobs" do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "cat")
      job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
      job2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category)
      visit category_path(category)

      expect(page).to have_content(job1.title)
      expect(page).to have_content(job2.title)
    end
  end
end
