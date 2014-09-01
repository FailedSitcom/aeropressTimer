FactoryGirl.define do
  factory :user do
    first_name "First"
    last_name  "Last"
    sequence(:email) { |n| "user#{n}@aeropressTimer.com" }
    password   "password1234"
    password_confirmation   "password1234"
  end

  factory "recipe" do
    title "Recipe Title"
    coffee "10"
    water "50"
    seconds "20"
    description "Recipe Description"
    user
  end
end
