require 'rails_helper'

RSpec.describe "order_items/index", type: :view do
  before(:each) do
    assign(:order_items, [
      OrderItem.create!(
        :order_id => 2,
        :variant_id => 3,
        :shopify_product_id => 4,
        :shopify_variant_id => 5,
        :unit_price => 6.5,
        :quantity => 7
      ),
      OrderItem.create!(
        :order_id => 2,
        :variant_id => 3,
        :shopify_product_id => 4,
        :shopify_variant_id => 5,
        :unit_price => 6.5,
        :quantity => 7
      )
    ])
  end

  it "renders a list of order_items" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.5.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
  end
end
