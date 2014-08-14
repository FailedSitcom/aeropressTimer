require 'spec_helper'

describe "Creating recipes" do
  it "redirects to the recipe index page on success" do
    visit "/recipes"
    click_link "New Recipe"
    expect(page).to have_content("New recipe")

    fill_in "Title", with: "Koppi"
    fill_in "Coffee", with: "18"
    fill_in "Water", with: "220"
    fill_in "Seconds", with: "90"
    fill_in "Description", with: "My everyday coffee recipe"
    click_button "Create Recipe"

    expect(page).to have_content("Koppi")
  end

  it "displays and error when the recipe has no title" do
    expect(Recipe.count).to eq(0)

    visit "/recipes"
    click_link "New Recipe"
    expect(page).to have_content("New recipe")

    fill_in "Title", with: ""
    fill_in "Coffee", with: "18"
    fill_in "Water", with: "220"
    fill_in "Seconds", with: "90"
    fill_in "Description", with: "My everyday coffee recipe"
    click_button "Create Recipe"

    expect(page).to have_content("error")
    expect(Recipe.count).to eq(0)

    visit "/recipes"
    expect(page).to_not have_content("Koppi")
  end
end
