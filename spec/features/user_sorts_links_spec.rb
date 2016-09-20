require "rails_helper"

feature "user sorts links" do
  scenario "user sees links sorted alphabetically", js: true do
    user = create(:user)
    linkB = create(:link, title: "B", user_id: user.id)
    linkC = create(:link, title: "c", user_id: user.id)
    linkA = create(:link, title: "a", user_id: user.id)

    user2 = create(:user, email: "other@gmail.com")
    other_link = create(:link, user_id: user2.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit links_path

    expect(page).to have_content("Sort Alphabetically")
    click_on("Sort Alphabetically")

    within("ul:first-child") do
      expect(page).to have_content("a")
    end

    within("ul:last-child") do
      expect(page).to have_content("c")
    end
  end
end
