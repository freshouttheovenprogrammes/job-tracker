require 'rails_helper'

describe "As a user" do
  it "I can delete a category from category index" do
    Category.create!(title: "Tech")
    visit categories_path
    save_and_open_page
    click_link "Delete Tech"

    expect(current_path).to eq categories_path
    expect(page).to_not have_content "category"
  end
end
