require 'spec_helper'


describe "Creating recipes" do
  let(:user) { create(:user) }
  def create_recipe(options={})
    options[:title] ||="Koppi"
    options[:coffee] ||="18"
    options[:water] ||="220"
    options[:seconds] ||="90"
    options[:description] ||="My everyday coffee recipe"

    visit "/recipes"
    click_link "Add Recipe"
    expect(page).to have_content("Add Recipe")

    fill_in "Title", with: options[:title]
    fill_in "Coffee", with: options[:coffee]
    fill_in "Water", with: options[:water]
    fill_in "Seconds", with: options[:seconds]
    fill_in "Description", with: options[:description]
    click_button "Create Recipe"
  end

  before do
    sign_in user, password: "password1234"
  end

  it "redirects to the recipe index page on success" do
    create_recipe
    expect(page).to have_content("Koppi")
  end

  it "displays an error when the recipe has no title" do
    expect(Recipe.count).to eq(0)

    create_recipe title: ""

    expect(page).to have_content("error")
    expect(Recipe.count).to eq(0)

    visit "/recipes"
    expect(page).to_not have_content("Koppi")
  end

  it "displays an error when the coffee field is empty" do
    expect(Recipe.count).to eq(0)

    create_recipe coffee: ""

    expect(page).to have_content("error")
    expect(Recipe.count).to eq(0)

    visit "/recipes"
    expect(page).to_not have_content("18")
  end

  it "displays an error when the water field is empty" do
    expect(Recipe.count).to eq(0)

    create_recipe water: ""

    expect(page).to have_content("error")
    expect(Recipe.count).to eq(0)

    visit "/recipes"
    expect(page).to_not have_content("220")
    end

  it "displays an error when the seconds field is empty" do
    expect(Recipe.count).to eq(0)

    create_recipe seconds: ""

    expect(page).to have_content("error")
    expect(Recipe.count).to eq(0)

    visit "/recipes"
    expect(page).to_not have_content("90")
  end


  it "displays an error when the description field is empty" do
    expect(Recipe.count).to eq(0)

    create_recipe description: ""

    expect(page).to have_content("error")
    expect(Recipe.count).to eq(0)

    visit "/recipes"
    expect(page).to_not have_content("My everyday coffee recipe")
  end
end
