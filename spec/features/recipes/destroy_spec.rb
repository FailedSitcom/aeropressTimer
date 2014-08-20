require 'spec_helper'

describe "Deleting recipes" do
  let(:user) { recipe.user }
  let!(:recipe) { create(:recipe) }

  before do
    sign_in user, password: "password1234"
  end

  it "is successful when clicking the destroy link" do
    visit "/recipes"

    within "#recipe_#{recipe.id}" do
      click_link "Destroy"
    end
    expect(page).to_not have_content(recipe.title)
    expect(Recipe.count).to eq(0)
  end
end
