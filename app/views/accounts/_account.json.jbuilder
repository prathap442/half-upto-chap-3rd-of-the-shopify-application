json.extract! account, :id, :shopify_account_url, :shopify_shared_secret, :shopify_api_key, :shopify_password, :created_at, :updated_at
json.url account_url(account, format: :json)
