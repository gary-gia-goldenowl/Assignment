require 'rails_helper'

RSpec.describe "checkouts/index", type: :view do
  before(:each) do
    assign(:checkouts, [
      Checkout.create!(
        name: "Name",
        phonenumber: "Phonenumber",
        email: "Email",
        address: "Address"
      ),
      Checkout.create!(
        name: "Name",
        phonenumber: "Phonenumber",
        email: "Email",
        address: "Address"
      )
    ])
  end

  it "renders a list of checkouts" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Phonenumber".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
  end
end
