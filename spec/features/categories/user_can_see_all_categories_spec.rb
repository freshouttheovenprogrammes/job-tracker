require 'rails_helper'

describe "As a user" do
  it "I can see all categories" do
    c1 = Category.create!(title: "cat1")
    c2 = Category.create!(title: "cat2")
    c3 = Category.create!(title: "cat3")
    c4 = Category.create!(title: "cat4")
    visit categories_path

    expect(page).to have_content c1.title
    expect(page).to have_content c2.title
    expect(page).to have_content c3.title
    expect(page).to have_content c4.title
  end
end
