class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(id: params[:friend_id])
    current_user.friends << friend
    redirect_to my_friends_path, notice: "You have followed #{friend.decorate.full_name}"
  end

  def destroy
    friend = User.find_by(id: params[:id])
    current_user.friends.delete(friend)
    redirect_to my_friends_path, notice: "You have stopped following #{friend.decorate.full_name}"
  end
end
