class DragonsController < ApplicationController

  def index
    @dragon = Dragon.all
  end

  def show
    @dragon = dragon.find(params[:id])
  end

end
