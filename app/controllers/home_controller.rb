# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result
    # other controller stuff
  end

  def show
    @products = Product.all
    # other controller stuff
  end
end
