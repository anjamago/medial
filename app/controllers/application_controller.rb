class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
    @search = Product.search(params[:nombre])
    @products = @search.result
  end
end
