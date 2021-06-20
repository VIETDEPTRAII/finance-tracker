class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by(ticker: params[:ticker])
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
    UserStock.create(user: current_user, stock: stock)
    redirect_to root_path, notice: "You have add #{stock.ticker} stock to your portfolio"
  end
end
