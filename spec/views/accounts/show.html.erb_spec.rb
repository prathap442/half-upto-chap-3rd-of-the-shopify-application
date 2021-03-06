require 'rails_helper'

RSpec.describe "accounts/show", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :shopify_account_url => "Shopify Account Url",
      :shopify_shared_secret => "Shopify Shared Secret",
      :shopify_api_key => "Shopify Api Key",
      :shopify_password => "Shopify Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Shopify Account Url/)
    expect(rendered).to match(/Shopify Shared Secret/)
    expect(rendered).to match(/Shopify Api Key/)
    expect(rendered).to match(/Shopify Password/)
  end
end
