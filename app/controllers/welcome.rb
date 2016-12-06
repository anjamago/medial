class ProductsController < ApplicationController
  def set_search
    @search = Product.search(params[:q])
    @products = @search.result

end
  end
end
