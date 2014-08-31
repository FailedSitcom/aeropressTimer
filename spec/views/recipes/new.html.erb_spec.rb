require 'spec_helper'



describe "recipes/new" do
  before(:each) do
    assign(:recipe, stub_model(Recipe,
      :title => "MyText",
      :coffee => 1,
      :water => 1,
      :seconds => 1,
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new recipe form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", recipes_path, "post" do
      assert_select "input#recipe_title[name=?]", "recipe[title]"
      assert_select "input#recipe_coffee[name=?]", "recipe[coffee]"
      assert_select "input#recipe_water[name=?]", "recipe[water]"
      assert_select "input#recipe_seconds[name=?]", "recipe[seconds]"
      assert_select "input#recipe_description[name=?]", "recipe[description]"
    end
  end
end
