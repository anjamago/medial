class StaticPagesController < ApplicationController

  def search

    respond_to do |format|
      @rango = {
        "product" => [],
        "labs" => [],

      }

      @products = Product.all
      @labs = Lab.all


      @rango[:product] = @products
      @rango[:labs] = @labs

      format.json { render json: @rango, status: :created, location: @rango }
    end
  end
end
