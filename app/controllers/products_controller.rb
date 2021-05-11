# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  helper_method :sort_column, :sort_direction

  # GET /products or /products.json
  def index
    @q = Product.ransack(params[:q])
    if params[:category_id]
      @products = Category.find(params[:category_id]).products.order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
      @categories = Category.find(params[:category_id])
    elsif params[:product] && params[:product][:category_id]
      @products = @q.result.order(sort_column + ' ' + sort_direction).paginate(page: params[:page]).search(params[:product][:category_id])
      @categories = Category.all
    else
      @categories = Category.all
      @products = @q.result(distinct: true).order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    end
  end

  def search
    index
    render :index
  end

  # GET /products/1 or /products/1.json
  def show
    @products = Product.all
    @related_products = Product.where(category_id: @product.category_id)
  end

  # GET /products/new
  def new
    @categories = Category.all
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products or /products.json
  def create
    @categories = Category.all
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : 'price'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:category_id, :name, :description, :price, photos: [])
  end
end
