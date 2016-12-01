class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    find_product
    if @product.nil?
      flash[:error] = "No existe el producto"
      redirect_to root_path
    end
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        redirect_to products_path
      end
  end

  def delete
  end

  def show
    find_product
    if @product.nil?
      flash[:error] = "Houston we are in troubles, please dont hack us."
      redirect_to root_path
    end
  end


  def update
  end

  private

  def find_product
    @product = Product.find_by(id: params[:id])
  end

  #strong parameters
  def product_params
    params.require(:product).permit(:id_laboratorio , :nombre , :precio_compra , :imagen)
  end
end
