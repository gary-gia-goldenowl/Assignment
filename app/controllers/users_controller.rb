class UsersController < Devise::SessionsController
  before_action :set_search
  def new
    @q = Product.ransack(params[:q])
    if params[:category_id]
      @products = Category.find(params[:category_id]).products.paginate(page: params[:page])
      @categories = Category.find(params[:category_id])
    elsif params[:product] && params[:product][:category_id]
      @products = @q.result(distinct: true).paginate(page: params[:page]).search(params[:product][:category_id])
      @categories = Category.all
    else
      @categories = Category.all
      @products = @q.result(distinct: true).paginate(page: params[:page])
    end
  end
end
