class DragonsController < ApplicationController

  def new
    @dragon = dragon.new
  end

  def show
    @dragon = dragon.find(params[:id])
  end

end
