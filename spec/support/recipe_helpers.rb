module RecipeHelpers
  def visit_recipe(recipe)
    visit "/recipes"
    within dom_if_for(list) do
      click_link "List Recipes"
    end
  end
end
