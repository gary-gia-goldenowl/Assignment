# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_search
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_search
    @q = Product.ransack(params[:q])
    if params[:category_id]
      @products = Category.find(params[:category_id]).products.paginate(page: params[:page])
      @categories = Category.find(params[:category_id])
    elsif params[:product] && params[:product][:category_id]
      @products = @q.result.paginate(page: params[:page]).search(params[:product][:category_id])
      @categories = Category.all
    else
      @categories = Category.all
      @products = @q.result(distinct: true).paginate(page: params[:page])
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[username email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
