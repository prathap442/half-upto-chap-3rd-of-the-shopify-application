require 'rails_helper'

RSpec.describe "order_items/new", type: :view do
  before(:each) do
    assign(:order_item, OrderItem.new(
      :order_id => 1,
      :variant_id => 1,
      :shopify_product_id => 1,
      :shopify_variant_id => 1,
      :unit_price => 1.5,
      :quantity => 1
    ))
  end

  it "renders new order_item form" do
    render

    assert_select "form[action=?][method=?]", order_items_path, "post" do

      assert_select "input[name=?]", "order_item[order_id]"

      assert_select "input[name=?]", "order_item[variant_id]"

      assert_select "input[name=?]", "order_item[shopify_product_id]"

      assert_select "input[name=?]", "order_item[shopify_variant_id]"

      assert_select "input[name=?]", "order_item[unit_price]"

      assert_select "input[name=?]", "order_item[quantity]"
    end
  end
end
