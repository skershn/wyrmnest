class Dragon < ApplicationRecord
  belongs_to :user
  #belongs_to :dragon_type
  r = Randomizer.new

  def initialize
    generate_dragon
  end

  private

  def generate_class
    case r.roll
    when 0..15
      common
    when 16..20
      rare
    end
  end

  def common
    case r.roll
    when 0..6
      red
    when 7..13
      blue
    when 14..20
      green
    end
  end

  def rare
    case r.roll
    when 0..9
      opal
    when 10..20
      soot
    end
  end

end