require "spec_helper"

describe "Logging In" do
  it "logs the user in and goes to the recipes" do
    User.create(first_name: "Samuel", last_name: "Durkin", email: "sam.thomas.durkin@gmail.com", password: "password1234", password_confirmation: "password1234")
    visit new_user_session_path
    fill_in "Email Address", with: "sam.thomas.durkin@gmail.com"
    fill_in "Password", with: "password1234"
    click_button "Sign In"

    expect(page).to have_content("Recipes")
    expect(page).to have_content("Thanks for logging in!")
  end

  it "displays the email address in the event of a failed login" do
    visit new_user_session_path
    fill_in "Email Address", with: "sam.thomas.durkin@gmail.com"
    fill_in "Password", with: "incorrect"
    click_button "Sign In"

    expect(page).to have_content("Please check your email and password")
    expect(page).to have_field("Email Address", with: "sam.thomas.durkin@gmail.com")
  end
end
