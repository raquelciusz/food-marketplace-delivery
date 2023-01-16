class ProductController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    authorize @product
  end

  def destroy
    @product.destroy
    redirect_to products_path, status: :see_other, notice: "Product deleted with success!"
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: "Product updated with success!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end

  def product_params
    params.require(:product).permit(:name, :ingredient, :storage, :price, :description, :user_id)
  end
end
