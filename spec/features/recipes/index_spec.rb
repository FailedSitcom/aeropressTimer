require "spec_helper"

describe "Listing recipes" do
  it "requires login" do
    visit "/recipes"
    expect(page).to have_content("You must be logged in")
  end
end
