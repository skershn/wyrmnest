class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :topics
  has_many :comments
  has_many :dragons
  has_one_attached :avatar

  def thumbnail
    return self.avatar.variant(resize: '100x100')
  end

  def userimage
    return self.photo.variant(resize: '800x800>')
  end

  def add_posts
    t = self.topics.count
    c = self.comments.count
    total = t + c
    if total % 5 == 0
      spawndragon = spawn
    end
    self.save
    spawndragon
  end

  def spawn
    d = Dragon.randomize
    self.dragons << d
    d    
  end




  

end
