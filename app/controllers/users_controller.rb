
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    
  end

  def click
    self.clicks += 1
    self.save
    case self.clicks
    when 5
      dragon_type = DragonType.new(rarity:0).order(:random).first
    #  dragon_type = DragonType.create(rarity: 0, description: "A large green and blue egg. Somewhat like a large chicken egg.")
      d = Dragon.new(dragon_type: dragon_type, user: self)
      d.save
    end
  end
end
