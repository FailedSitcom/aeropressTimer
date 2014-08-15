require 'spec_helper'

describe "Deleting recipes" do
  let!(:recipe) { Recipe.create(title: "Koppi", coffee: "18", water: "220", seconds: "90", description: "My everyday coffee recipe")
}

  it "is successful when clicking the destroy link" do
    visit "/recipes"

    within "#recipe_#{recipe.id}" do
      click_link "Destroy"
    end
    expect(page).to_not have_content(recipe.title)
    expect(Recipe.count).to eq(0)
  end
end
