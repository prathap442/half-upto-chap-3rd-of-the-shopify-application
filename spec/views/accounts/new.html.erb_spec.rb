require 'rails_helper'

RSpec.describe "accounts/new", type: :view do
  before(:each) do
    assign(:account, Account.new(
      :shopify_account_url => "MyString",
      :shopify_shared_secret => "MyString",
      :shopify_api_key => "MyString",
      :shopify_password => "MyString"
    ))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input[name=?]", "account[shopify_account_url]"

      assert_select "input[name=?]", "account[shopify_shared_secret]"

      assert_select "input[name=?]", "account[shopify_api_key]"

      assert_select "input[name=?]", "account[shopify_password]"
    end
  end
end
