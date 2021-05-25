class CartsController < ApplicationController
  def show
    # byebug
    redirect_to new_user_session_path if current_order.nil? && current_user.nil?
    @order_items = current_order.order_items if current_order.present?
  end

  def destroy
    current_order.order_items.destroy_all
    current_user.orders.destroy_all
    respond_to do |format|
      format.html { redirect_to cart_url }
      format.json { head :no_content }
    end
  end
end
