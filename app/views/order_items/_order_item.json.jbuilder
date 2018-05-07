json.extract! order_item, :id, :order_id, :variant_id, :shopify_product_id, :shopify_variant_id, :unit_price, :quantity, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
