require 'rails_helper'

RSpec.describe "order_items/show", type: :view do
  before(:each) do
    @order_item = assign(:order_item, OrderItem.create!(
      :order_id => 2,
      :variant_id => 3,
      :shopify_product_id => 4,
      :shopify_variant_id => 5,
      :unit_price => 6.5,
      :quantity => 7
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6.5/)
    expect(rendered).to match(/7/)
  end
end
