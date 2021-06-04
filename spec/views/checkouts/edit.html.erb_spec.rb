require 'rails_helper'

RSpec.describe "checkouts/edit", type: :view do
  before(:each) do
    @checkout = assign(:checkout, Checkout.create!(
      name: "MyString",
      phonenumber: "MyString",
      email: "MyString",
      address: "MyString"
    ))
  end

  it "renders the edit checkout form" do
    render

    assert_select "form[action=?][method=?]", checkout_path(@checkout), "post" do

      assert_select "input[name=?]", "checkout[name]"

      assert_select "input[name=?]", "checkout[phonenumber]"

      assert_select "input[name=?]", "checkout[email]"

      assert_select "input[name=?]", "checkout[address]"
    end
  end
end
