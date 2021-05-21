# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_search
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_order
  skip_before_action :verify_authenticity_token

  def set_search
    @q = Product.ransack(params[:q])
  end

  def current_order
    if current_user.present? && current_user.orders.present?
      current_user.orders.last
    elsif current_user.present?
      current_user.orders.new
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[username email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
