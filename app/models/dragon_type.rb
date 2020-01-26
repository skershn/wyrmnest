class DragonType < ApplicationRecord
#  enum rarity: [:common_dragon, :rare_dragon]

=begin
  def color
    col = [1..4]
    get = col.sample
    if get == 1
      puts "green"
    elsif get == 2
      puts "blue"
    elsif get == 3
      puts "red"
    else
      rare = [1, 2]
      rareget = rare.sample
      if rareget == 1
        puts "opal"
      else
        puts "soot"
      end
    end
  end

=end
 

end