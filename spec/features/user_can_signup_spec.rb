require 'rails_helper'

feature "user can sign up" do
  scenario "unauthenticated user signs up successfully, is logged in" do
    visit root_path

    expect(current_path).to eq(login_path)

    expect(page).to have_content("Log In")
    expect(page).to have_content("Sign Up")

    click_on("Sign Up")

    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "anna@hotmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create Account"

    expect(current_path).to eq(links_path)
  end
end
