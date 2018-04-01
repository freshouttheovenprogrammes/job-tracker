require 'rails_helper'

describe "As a User" do
  it "I can navigate to the new category path from the root" do
    visit root_path

    click_link "Create New Category"

    expect(current_path).to eq new_category_path
    expect(page).to have_content "Create Category"

    fill_in "category[name]", with: "New Category"
    click_on "Submit"

    expect(page).to have_content "New Category"
  end
end
