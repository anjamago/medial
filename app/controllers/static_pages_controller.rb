class StaticPagesController < ApplicationController

  def search

    respond_to do |format|
      @rango = {
        "product" => [],
        "labs" => [],
      }
      min = params[:min].to_i
      max = !params[:max].to_i == 0 ? params[:max].to_i : 9999999
      pnombre = !params[:nombre].blank? ? params[:nombre] : ''
      lnombre = !params[:labs].blank? ? params[:labs] : ''
      @products = Product.where('nombre LIKE ?', "%#{pnombre}%").where(precio_compra: min..max)
      @labs = Lab.where('nombre LIKE ?', "%#{lnombre}%")
      @rango[:product] = @products
      @rango[:labs] = @labs
      format.json { render json: @rango.to_json, status: :created, location: @rango }
    end
  end
end
