require 'spec_helper'

describe "recipes/index" do
  before(:each) do
    assign(:recipes, [
      stub_model(Recipe,
        :title => "Title",
        #:coffee => 1,
        #:water => 2,
        #:seconds => 3,
        :description => "MyText"
      ),
      stub_model(Recipe,
        :title => "Title",
        #:coffee => 1,
        #:water => 2,
        #:seconds => 3,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of recipes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "ul.recipes li div", :text => "Title".to_s, :count => 4
    #assert_select "tr>td", :text => 1.to_s, :count => 2
    #assert_select "tr>td", :text => 2.to_s, :count => 2
    #assert_select "tr>td", :text => 3.to_s, :count => 2
    #assert_select "p", :text => "MyText".to_s, :count => 2
  end
end
