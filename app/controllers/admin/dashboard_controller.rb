class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => ENV["ADMIN_NAME"], :password => ENV["ADMIN_PASSWORD"]
 
  def show
    @products = Product.order(id: :desc).all.count
    @categories = Category.all.count
   # @products = Product.all.order(created_at: :desc)
    puts "+++++++++++++++++++++ #{@products}"
  end
end
