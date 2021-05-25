class CheckoutController < ApplicationController
  def create
    product = Product.find(params[:id])
    if product.nil?
      redirect_to root_path
      return
    end
    # Setting up a Stripe session for payment
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['Visa_card'],
      line_items: [{
        name: product.name,
        description: product.description,
        amount: product.price,
        currency: 'cad'
      }],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      format.js
    end
  end

  def update; end

  def destroy; end
end
