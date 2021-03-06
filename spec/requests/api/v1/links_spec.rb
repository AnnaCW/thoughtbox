require 'rails_helper'

describe "Links Endpoint" do
  it "updates link status" do
    user = create(:user)
    link = create(:link, user_id: user.id, read: "true")
    update_params = {read: "false"}

    patch "/api/v1/links/#{link.id}.json", params: {link: update_params}

    expect(response).to be_success

    parsed_response = JSON.parse(response.body)

    expect(parsed_response["read"]).to eq(false)
  end

  it "returns user's sorted links" do
    user = create(:user)
    linkB = create(:link, title: "B", user_id: user.id)
    linkC = create(:link, title: "c", user_id: user.id)
    linkA = create(:link, title: "a", user_id: user.id)

    user2 = create(:user, email: "other@gmail.com")
    other_link = create(:link, title: "other", user_id: user2.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    get "/api/v1/links.json"

    expect(response).to be_success

    parsed_response = JSON.parse(response.body)

    expect(parsed_response.length).to eq(3)
    expect(parsed_response.first['title']).to eq("a")
    expect(parsed_response.last['title']).to eq("c")
  end

  it "does not return another user's links" do
    user = create(:user)
    target_link = create(:link, title: "target", user_id: user.id)

    user2 = create(:user, email: "other@gmail.com")
    other_link = create(:link, title: "other", user_id: user2.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    get "/api/v1/links.json"

    expect(response).to be_success

    parsed_response = JSON.parse(response.body)

    expect(parsed_response.length).to eq(1)
    expect(parsed_response.first['title']).to eq("target")
    expect(parsed_response).to_not include("other")
  end

end
