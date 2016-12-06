class ProductsController < ApplicationController
before_action :authenticate_user!#autenticador se coloca en el controlador que quieras restringir
  def index
    @products = Product.all

  end

  def new
    @product = Product.new
    @labs = Lab.all
  end

  def edit
    find_product
    @labs = Lab.all
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

  def destroy
    find_product
    if @product.destroy
      flash[:error] = "producto eliminado"
      redirect_to products_path
    end
  end

  def show
    find_product
    if @product.nil?
      flash[:error] = "producto"
      redirect_to root_path
    end
  end


  def update
    find_product
    if @product.update(product_params)
      flash[:success] = "Product created. Ok"
      redirect_to products_path
    else
      @products = Product.all
      render 'edit'
    end

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
