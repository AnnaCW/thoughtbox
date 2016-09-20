require 'rails_helper'

describe "Links Endpoint" do

  it "updates a link" do
    user = create(:user)
    link = create(:link, user_id: user.id, read: "true")
    update_params = {read: "false"}

    patch "/api/v1/links/#{link.id}.json", params: {link: update_params}

    expect(response).to be_success

    parsed_response = JSON.parse(response.body)

    expect(parsed_response["read"]).to eq(false)
  end

end
