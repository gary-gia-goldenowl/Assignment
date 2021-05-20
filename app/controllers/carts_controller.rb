class CartsController < ApplicationController
  def show
    # byebug
    redirect_to new_user_session_path if current_order.nil? && current_user.nil?
    @order_items = current_order.order_items
  end
end
