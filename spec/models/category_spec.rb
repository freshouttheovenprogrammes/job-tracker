require 'rails_helper'

describe Category, type: :model do
  context "validations" do

  end
  context "relationships" do
    it "has many jobs" do
      category = Category.new(title: "cat")
      expect(category).to respond_to(:jobs)
    end
  end
end
