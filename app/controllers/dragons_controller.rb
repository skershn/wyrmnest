class DragonsController < ApplicationController

  def create
    @dragon = dragon.new
    @dragon.save
  end

  def show
    @dragon = dragon.find(params[:id])
  end

end
