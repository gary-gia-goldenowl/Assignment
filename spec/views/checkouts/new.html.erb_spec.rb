require 'rails_helper'

RSpec.describe "checkouts/new", type: :view do
  before(:each) do
    assign(:checkout, Checkout.new(
      name: "MyString",
      phonenumber: "MyString",
      email: "MyString",
      address: "MyString"
    ))
  end

  it "renders new checkout form" do
    render

    assert_select "form[action=?][method=?]", checkouts_path, "post" do

      assert_select "input[name=?]", "checkout[name]"

      assert_select "input[name=?]", "checkout[phonenumber]"

      assert_select "input[name=?]", "checkout[email]"

      assert_select "input[name=?]", "checkout[address]"
    end
  end
end
