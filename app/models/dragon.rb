class Dragon < ApplicationRecord
  belongs_to :user

  def initialize(color)
    @color = color
  end

  def color
    @color
  end

  private

  

  def randomize
    @c = [1..20]
    case @c.sample
    when 1..15
      common_dragon
    when 16..20
      rare_dragon
    end
  end

  def common_dragon
    rc = @c.sample
    case rc
    when 1..7
      red
    when 8..14
      blue
    when 15..20
      green
    end
  end

  def rare_dragon
    rr = @c.sample
    case rr
    when 1..10
      soot
    when 11..20
      opal
    end
  end  


  def red
    "red"  
  end

  def blue
    "blue"
  end

  def green
    "green"
  end

  def opal
    "opal"
  end

  def soot
    "soot"
  end
end