# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    redirect_to products_path if current_user.present? && current_user.admin?
    @best_sellers = Product.where(bestseller: true)
    @products = Product.all
    @categories = Category.all
    @order_item = OrderItem.new(order: current_order)
  end

  def show
    @products = Product.all
  end
end
