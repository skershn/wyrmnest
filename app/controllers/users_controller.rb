
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user.update_attributes(user_params)
  end

  def dragon_get
    @possible_dragon = @user.add_posts
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end
