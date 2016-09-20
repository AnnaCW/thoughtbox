require "rails_helper"

feature "user edits link status" do
  scenario "user sees updated status", js: true do
    user = create(:user)
    read_link = create(:link, read: "true", user_id: user.id)
    unread_link = create(:link, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit links_path

    within("ul#link#{unread_link.id}") do
      expect(page).to have_content("Mark As Read")
      find("button#button#{unread_link.id}")
    end

    within("ul#link#{read_link.id}") do
      expect(page).to have_content("Mark As Unread")
      find("button#button#{read_link.id}")
    end

  end
end
