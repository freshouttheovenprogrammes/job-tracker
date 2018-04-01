require 'rails_helper'

describe "As a user" do
  context "from the categories index path" do
    it "I can edit a category" do
      c1 = Category.create!(title: "category")
      visit categories_path

      click_link "Edit #{c1.title}"

      expect(current_path).to eq edit_category_path(c1)

      fill_in "category[title]", with: "new category"
      click_on "Update Category"

      expect(current_path).to eq category_path(c1)
      expect(page).to have_content "new category"
      expect(page).to have_content "new category updated!"
    end
  end
end
