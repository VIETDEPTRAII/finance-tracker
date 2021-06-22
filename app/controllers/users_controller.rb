class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @my_friends = current_user.friends
  end

  def search_friends
    respond_to do |format|
      if params[:email_or_name].blank?
        flash.now[:alert] = 'Please type a email or name of your friends!'
      else
        @friends = User.where("email = :email_or_name OR first_name LIKE :email_or_name OR last_name LIKE :email_or_name", {email_or_name: params[:email_or_name]})
        flash.now[:alert] = 'Sorry! No results found' if @friends.blank?
      end
      format.js { render partial: 'search_friends_result' }
    end
  end
end
