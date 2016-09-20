require "rails_helper"

feature "user edits link status" do
  scenario "user sees updated status", js: true do
    user = create(:user)
    target_link = create(:link, user_id: user.id)
    other_link = create(:link, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit links_path

    within("ul#link#{target_link.id}") do
      expect(page).to have_content("Mark As Read")
      # page.check("unread#{target_link.id}")
      # expect(page).to have_content("Mark As Unread")
    end

  end
end
