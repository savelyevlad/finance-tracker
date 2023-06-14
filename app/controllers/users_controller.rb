class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @my_friends = current_user.friends
  end

  def search
    respond_to do |format|
      format.js { render partial: 'friends/search_js' }
    end
  end
end
