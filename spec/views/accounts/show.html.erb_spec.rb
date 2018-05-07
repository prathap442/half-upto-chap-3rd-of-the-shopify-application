require 'rails_helper'

RSpec.describe "accounts/show", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :shopify_account_urlL => "Shopify Account Url L",
      :shopify_api_key => "Shopify Api Key",
      :shopify_shared_secret => "Shopify Shared Secret"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Shopify Account Url L/)
    expect(rendered).to match(/Shopify Api Key/)
    expect(rendered).to match(/Shopify Shared Secret/)
  end
end
