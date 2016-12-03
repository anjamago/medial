class StaticPagesController < ApplicationController

  def search

    @rango = {
      "product" => [],
      "labs" => [],
      "success" => '',
      "errors" =>''
    }
    @min = params[:min]
    @max = params[:max]
    @product = params[:products]
    @lab = params[:labs]
    @products = Product.all
    @labs = Lab.all

    if @min.nil? || @max.nil?
      foreach @products do |p|
        if p.precio_compra > @min && p.precio_compra < @max
          @rango[:product].puts p
          @rango[:success] = '200'
        end
      end
    end

    if @lab.nil?
        foreach @labs do |l|
          if l.name == @lab
            @rango[:labs].puts l
            @rango[:success] = '200'
          end
        end
    end

    @rango[:errors] = @rango[:product] == '' ? '400' : ''

    @rango
  end
end
