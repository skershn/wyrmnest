class DragonsController < ApplicationController

  def index
    @dragon = Dragon.all.order("created_at DESC")
  end

  def new
    @dragon = Dragon.new
  end

  def create
    @dragon = current_user.dragons.create(dragon_params)
    if @dragon.valid?
      redirect_to dragons_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @dragon = dragon.find(params[:id])
  end

  def destroy
    #boolean thread
    verify_user
    @dragon.destroy
    redirect_to user_path(@user)
  end

  private

  def dragon_params
    params.require(:dragon).permit(:dragon_type)
  end

  def find_dragon
    @dragon = Dragon.find(params[:id])
  end

  def verify_user
    if current_user != @dragon.user
      return render plain: 'forbidden', status: :forbidden
    end
  end

end
