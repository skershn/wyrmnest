class ClickersController < ApplicationController
  def index
    @clickers = Clicker.all
  end

  def increment
    @clicker = Clicker.find(params[:id])
    @clicker.clicks += 1
    @clicker.save
  end
end
