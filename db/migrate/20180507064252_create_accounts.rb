class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :shopify_account_url
      t.string :shopify_shared_secret
      t.string :shopify_api_key
      t.string :shopify_password

      t.timestamps
    end
  end
end
