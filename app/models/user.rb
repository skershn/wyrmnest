class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :topics
  has_many :comments
  has_many :dragons
  has_one_attached :avatar

  def comment
    self.comments += 1
    self.save
    case self.comments
    when 5
      dragon_type = DragonType.where(class:0).order|:random|.first
      d = Dragon.new(dragon_type: dragon_type)
    end
  end
end
