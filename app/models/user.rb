class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :topics
  has_many :comments
  has_many :dragons
  has_one_attached :avatar

#  def click
#    self.clicks += 1
#    self.save
#    case self.clicks
#    when 5
#      dragon_type = DragonType.new(rarity:0).order(:random).first
#      dragon_type = DragonType.create(rarity: 0, description: "A large green and blue egg. Somewhat like a large chicken egg.")
#      d = Dragon.new(dragon_type: dragon_type, user: self)
#      d.save
#    end
#  end

end
