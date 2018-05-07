class Account < ApplicationRecord
  validates_presence_of :shopify_account_url,:shopify_api_key,:shopify_password,:shopify_shared_secret
end
