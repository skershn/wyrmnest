class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :topics
  has_many :comments
  has_many :dragons
  has_one_attached :avatar

  def add_posts
    new_dragon = nil
    t = self.topics.count
    c = self.comments.count
    total = t + c
    if total % 5 == 0
      new_dragon = spawn
    end
    self.save
    new_dragon
  end

  def spawn
    d = Dragon.randomize
    self.dragons << d
    d    
  end




  

end
