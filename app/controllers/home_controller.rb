class HomeController < ApplicationController
    def index
      @products = Product.all
      # other controller stuff
    end

    def show
      @products = Product.all
      # other controller stuff
    end
  end
  