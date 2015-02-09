require 'rails_helper'

RSpec.describe "Dose", :type => :model do
  let (:mojito) do
    Cocktail.create!(name: "Mojito")
  end

  let (:lemon) do
    Ingredient.create!(name: "lemon")
  end

  let(:valid_attributes) do
    {
      description: "6cl",
      cocktail: mojito,
      ingredient: lemon
    }
  end

  it "has a description" do
    dose = Dose.new(description: "6cl")
    expect(dose.description).to eq("6cl")
  end

  it "belongs to a cocktail" do
    dose = Dose.new(cocktail: mojito)
    expect(dose.cocktail).to eq(mojito)
  end

  it "belogns to an ingredient" do
    dose = Dose.new(ingredient: lemon)
    expect(dose.ingredient).to eq(lemon)
  end

  it "cocktail cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:cocktail)
    dose = Dose.new(attributes)
    expect(dose).not_to be_valid
  end

  it "ingredient cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:ingredient)
    dose = Dose.new(attributes)
    expect(dose).not_to be_valid
  end

  it "is unique for a given cocktail/ingredient couple" do
    Dose.create!(valid_attributes)
    dose = Dose.new(valid_attributes.merge(description: "1cl"))
    expect(dose).not_to be_valid
  end

  # it "has many doses" do
  #   cocktail = Dose.new(valid_attributes)
  #   expect(cocktail).to respond_to(:reviews)
  # end

  # it "should destroy child reviews when destroying self" do
  #   cocktail = Dose.create!(valid_attributes)
  #   3.times { cocktail.reviews.create! content: "great!", rating: 5 }
  #   expect { cocktail.destroy }.to change { Review.count }.from(3).to(0)
  # end
end
