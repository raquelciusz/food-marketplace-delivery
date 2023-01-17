class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = policy_scope(Product)
    if params[:query].present?
      @products = Product.search(params[:query])
    else
      @products = Product.all
    end
  end

  def show
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.create(product_params)
    @product.user = current_user
    authorize @product
    # current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, status: :see_other, notice: "Product deleted with success!"
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: "Product updated with success!"
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
    params.require(:product).permit(:id, :name, :ingredient, :storage, :price, :description, :user_id, photos: [])
  end
end
