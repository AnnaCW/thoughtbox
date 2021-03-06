require "rails_helper"

feature "authenticated user edits link" do
  context "with valid information" do
    scenario "user sees updated link in index", js: true do
      user = create(:user)
      create_list(:link, 3, user_id: user.id)
      target_link = create(:link, title: "Old Title", url: "https://www.yahoo.com", user_id: user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

      visit links_path

      within("ul#link#{target_link.id}") do
        click_on "Edit"
      end

      expect(current_path).to eq edit_link_path(target_link.id)

      expect(page).to have_content("Edit Link")

      fill_in "Title", with: "Updated Title"
      fill_in "Url", with: "https://www.google.com"
      click_on "Update"

      expect(current_path).to eq(links_path)

      expect(page).to have_content "Updated Title"
      expect(page).to have_content "https://www.google.com"

      expect(page).to_not have_content "Old Title"
      expect(page).to_not have_content "https://www.yahoo.com"
    end
  end

  context "with invalid information" do
    scenario "user error message", js: true do
      user = create(:user)
      create_list(:link, 3, user_id: user.id)
      target_link = create(:link, title: "Title", url: "https://www.yahoo.com", user_id: user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

      visit links_path

      within("ul#link#{target_link.id}") do
        click_on "Edit"
      end

      expect(current_path).to eq edit_link_path(target_link.id)

      expect(page).to have_content("Edit Link")

      fill_in "Url", with: "https.gle.com"
      click_on "Update"

      expect(page).to have_content("Url is not a valid URL")
    end
  end
end
