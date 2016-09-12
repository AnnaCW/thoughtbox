require 'rails_helper'

feature "user can sign up" do
  scenario "unauthenticated user signs up successfully, is logged in" do
    visit root_path

    expect(current_path).to_eq(new_user_path)

    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Log In")

    click_on("Sign Up")
    fill_in "Email", with: "anna@hotmail.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_on "Create Account"

    expect(current_path).to_eq(links_path)
  end
end
