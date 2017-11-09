require 'rails_helper'

RSpec.describe "Ingredient", :type => :model do
  let(:valid_attributes) do
    {
      name: "Lemon"
    }
  end

  it "has a name" do
    ingredient = Ingredient.new(name: "Lemon")
    expect(ingredient.name).to eq("Lemon")
  end

  it "name cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:name)
    ingredient = Ingredient.new(attributes)
    expect(ingredient).not_to be_valid
  end

  it "name is unique" do
    Ingredient.create!(name: "Lemon")
    ingredient = Ingredient.new(name: "Lemon")
    expect(ingredient).not_to be_valid
  end

  it "has many doses" do
    ingredient = Ingredient.new(valid_attributes)
    expect(ingredient).to respond_to(:doses)
    expect(ingredient.doses.count).to eq(0)
  end
end
