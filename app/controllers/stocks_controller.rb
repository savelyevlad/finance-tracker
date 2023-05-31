class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        if @stock.last_price == 0
          respond_to do |format|
            @stock = nil
            flash.now[:alert] = 'No such symbol'
            format.js { render partial: 'users/result_js' }
          end
        else
          respond_to do |format|
            format.js { render partial: 'users/result_js' }
          end
        end
      else
        respond_to do |format|
          flash.now[:alert] = 'Cannot connect to binance server'
          format.js { render partial: 'users/result_js' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Please enter a symbol to search'
        format.js { render partial: 'users/result_js' }
      end
    end
  end

end
