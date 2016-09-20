require "rails_helper"

feature "authenticated user submits link" do
  scenario "user sees all user's links on index load", js: true do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit links_path

    fill_in "Title", with: "NYT"
    fill_in "Url", with: "https://www.nytimes.com"
    click_on "Submit Link"

    expect(page).to have_content "NYT"
    expect(page).to have_content "https://www.nytimes.com"
  end
end
