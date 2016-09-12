require "rails_helper"

feature "authenticated user submits link" do
  scenario "user sees all user's links on index load" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )
    create_list(:link, 3)

    visit links_path

    within("#1") do
      click_on "Edit"
    end

    expect(page).to have_content "NYT"
    expect(page).to have_content "www.nytimes.com"
  end
end
