require "rails_helper"

feature "authenticated user edits link" do
  scenario "user sees updated link in index" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit links_path


    fill_in "Title", with: "NYT"
    fill_in "Url", with: "www.nytimes.com"
    click_on "Submit Link"

    expect(page).to have_content "NYT"
    expect(page).to have_content "www.nytimes.com"

  end
end
