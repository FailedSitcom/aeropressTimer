require 'spec_helper'

describe "Editing recipes" do
  let!(:recipe) { Recipe.create(title: "Koppi", coffee: "18", water: "220", seconds: "90", description: "My everyday coffee recipe")
}

  def update_recipe(options={})
    options[:title] ||="Koppi"
    options[:coffee] ||="18"
    options[:water] ||="220"
    options[:seconds] ||="90"
    options[:description] ||="My everyday coffee recipe"

    recipe = options[:recipe]

    visit "/recipes"
    within "#recipe_#{recipe.id}" do
      click_link "Edit"
    end

    fill_in "Title", with: options[:title]
    fill_in "Coffee", with: options[:coffee]
    fill_in "Water", with: options[:water]
    fill_in "Seconds", with: options[:seconds]
    fill_in "Description", with: options[:description]
    click_button "Update Recipe"
  end

  it "updates a recipe successfully with correct information" do

    update_recipe recipe: recipe,
                  title: "New title",
                  coffee: "17",
                  water: "190",
                  seconds: "45",
                  description: "New description"

    recipe.reload

    expect(page).to have_content("Recipe was successfully updated.")
    expect(recipe.title).to eq("New title")
    expect(recipe.coffee).to eq(17)
    expect(recipe.water).to eq(190)
    expect(recipe.seconds).to eq(45)
    expect(recipe.description).to eq("New description")
  end
end
