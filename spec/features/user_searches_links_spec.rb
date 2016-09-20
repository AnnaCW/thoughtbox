require "rails_helper"

feature "user searches links" do
  scenario "user sees matching links", js: true do
    user = create(:user)
    create(:link, title: "favorite link", user_id: user.id)
    create(:link, title: "cats", user_id: user.id)
    create(:link, title: "favicons", user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit links_path

    expect(page).to have_content("favorite link")
    expect(page).to have_content("cats")
    expect(page).to have_content("favicons")

    fill_in "search-box", with: "fav"

    page.find("#search-box").trigger("change")

  end
end
