class StocksController < ApplicationController
  def index
    @stocks = Stock.where.not(producto: nil)
  end

  def new
      @stocks = Stock.new
      @products= Product.all
  end

  def create
    @stock = Stock.new(stock_params)
    @stock.id_usuario = current_user.id
    if @stock.save
      puts "Producto en Stock"
      flash[:success] = "Stock"
      redirect_to stocks_path
    else
      puts "algo va mal "
      redirect_to stocks_path
    end

  end


  def edit
    find_stock
    @products = Product.all
    if @stock.nil?
      flash[:error] = "No existe el producto"
      redirect_to root_path
    end
  end


    def destroy
      find_stock
      if @stock.destroy
        flash[:error] = "stock eliminado"
        redirect_to stocks_path
      end
    end

    def show
      find_stock
      if @stock.nil?
        flash[:error] = "stock"
        redirect_to root_path
      end
    end


    def update
      find_stock
      if @stock.update(stock_params)
        flash[:success] = "Product created. Ok"
        redirect_to stocks_path
      else
        @stocks = Stock.all
        render 'edit'
      end

    end

  private

  def find_stock
    @stock = Stock.find_by(id: params[:id])
  end

  #strong parameters
  def stock_params
    params.require(:stock).permit(:producto , :fecha_vencimiento , :cantidad)
  end
end
