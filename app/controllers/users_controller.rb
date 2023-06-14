class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @my_friends = current_user.friends
  end

  def search
    if params[:friend].present?
      @my_friends = User.search(params[:friend])
      if @my_friends.count == 0
        respond_to do |format|
          flash.now[:alert] = '0 people found'
          format.js { render partial: 'friends/search_js' }
        end
      else
        respond_to do |format|
          format.js { render partial: 'friends/search_js' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Please enter a name to search'
        format.js { render partial: 'friends/search_js' }
      end
    end

  end
end
