class HomeController < ApplicationController
    def index
      @product = Product.all
      # other controller stuff
    end

    def show
      @product = Product.all
      # other controller stuff
    end
  end
  