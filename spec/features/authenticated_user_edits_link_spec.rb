require "rails_helper"

feature "authenticated user edits link" do
  scenario "user sees updated link in index" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )
    create_list(:link, 3)

    visit links_path

    within("#1") do
      click_on "Edit"
    end

    expect(page).to have_content("Edit Link")

    fill_in "Title", with: "Updated Title"
    fill_in "Url", with: "www.google.com"
    click_on "Update"

    expect(current_path).to eq(links_path)

    expect(page).to have_content "Updated Title"
    expect(page).to have_content "www.google.com"

  end
end
