class StocksController < ApplicationController
  def index
    @stocks = Stock.all
  end

  def new
      @stocks = Stock.new
      @products= Product.all
  end

  def create
    @stock = Stock.new(stock_params)
    @stock.id_usuario = current_user.id
    if @stock.save
      puts "Vamos la luz perros "
      flash[:success] = "Stock"
      redirect_to stocks_path
    else
      puts "Buena la rata "
      redirect_to stocks_path
    end

  end


  def edit
  end

  def show

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
