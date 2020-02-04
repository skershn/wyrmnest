
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def dragon_get
    @possible_dragon = @user.add_posts
  end

  

end
