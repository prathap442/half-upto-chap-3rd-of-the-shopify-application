require 'rails_helper'

RSpec.describe "order_items/edit", type: :view do
  before(:each) do
    @order_item = assign(:order_item, OrderItem.create!(
      :order_id => 1,
      :variant_id => 1,
      :shopify_product_id => 1,
      :shopify_variant_id => 1,
      :unit_price => 1.5,
      :quantity => 1
    ))
  end

  it "renders the edit order_item form" do
    render

    assert_select "form[action=?][method=?]", order_item_path(@order_item), "post" do

      assert_select "input[name=?]", "order_item[order_id]"

      assert_select "input[name=?]", "order_item[variant_id]"

      assert_select "input[name=?]", "order_item[shopify_product_id]"

      assert_select "input[name=?]", "order_item[shopify_variant_id]"

      assert_select "input[name=?]", "order_item[unit_price]"

      assert_select "input[name=?]", "order_item[quantity]"
    end
  end
end
