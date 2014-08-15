require 'spec_helper'

describe "Viewing recipe items" do
  let!(:recipe) { Recipe.create(title: "Koppi", coffee: "18", water: "220", seconds: "90", description: "My morning coffee") }
  it "displays no items when recipe is empty" do
    visit "/recipes"
    within "#recipe_#{recipe.id}" do
      click_link "Recipe Items"
    end
    expect(page).to have_content("RecipeItems#index")
  end
end
