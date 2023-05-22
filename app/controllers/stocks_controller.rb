class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        if @stock.last_price == 0
          flash[:alert] = 'No such symbol'
          redirect_to my_portfolio_path
        else
          render 'users/my_portfolio'
        end
      else
        flash[:alert] = 'Cannot connect to binance server'
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = 'Please enter a symbol to search'
      redirect_to my_portfolio_path
    end
  end

end
