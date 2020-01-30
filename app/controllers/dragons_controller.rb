class DragonsController < ApplicationController

  def initialize
    generate_dragon
  end

  private

  def generate_dragon
    case @d.roll_20
    when 0..9
      common
    when 10..14
      opal
    when 15..20
      soot
    end
  end

  def common
    case @d.roll_20
    when 0..6
      red
    when 7..13
      blue
    when 13..20
      green
    end
  end

  def red
    red_dragon = Dragon.new
    red_dragon.user = current_user
    red_dragon.clicks = 0  
    red_dragon.name = string
  end

  def blue
    blue_dragon = Dragon.new
    blue_dragon.user = current_user
    blue_dragon.clicks = 0
  end

  def green
    green_dragon = Dragon.new
    green_dragon.user = current_user
    green_dragon.clicks = 0
  end

  def opal
    opal_dragon = Dragon.new
    opal_dragon.user = current_user
    opal_dragon.clicks = 0
  end

  def soot
    soot_dragon = Dragon.new
    soot_dragon.user = current_user
    soot_dragon.clicks = 0
  end

#attach images for each

  

end
