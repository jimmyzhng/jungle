class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: 'jungle', password: 'book'

  def show
   @products = Product.count
   @categories = Category.count
  end
  
end
