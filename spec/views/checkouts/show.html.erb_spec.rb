require 'rails_helper'

RSpec.describe "checkouts/show", type: :view do
  before(:each) do
    @checkout = assign(:checkout, Checkout.create!(
      name: "Name",
      phonenumber: "Phonenumber",
      email: "Email",
      address: "Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phonenumber/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Address/)
  end
end
