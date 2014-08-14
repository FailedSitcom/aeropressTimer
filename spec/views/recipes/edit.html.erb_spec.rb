require 'spec_helper'

describe "recipes/edit" do
  before(:each) do
    @recipe = assign(:recipe, stub_model(Recipe,
      :title => "MyText",
      :coffee => 1,
      :water => 1,
      :seconds => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit recipe form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", recipe_path(@recipe), "post" do
      assert_select "textarea#recipe_title[name=?]", "recipe[title]"
      assert_select "input#recipe_coffee[name=?]", "recipe[coffee]"
      assert_select "input#recipe_water[name=?]", "recipe[water]"
      assert_select "input#recipe_seconds[name=?]", "recipe[seconds]"
      assert_select "textarea#recipe_description[name=?]", "recipe[description]"
    end
  end
end
