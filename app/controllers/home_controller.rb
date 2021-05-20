# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @best_sellers = Product.where(bestseller: true)
    if !current_order.nil?
      @products = Product.all
      @categories = Category.all
      @order_item = current_order.order_items.new
    else
      @order = current_user.orders.new
      @order.save
      @products = Product.all
      @categories = Category.all
      @order_item = current_order.order_items.new
    end
  end

  def show
    @products = Product.all
  end
end
