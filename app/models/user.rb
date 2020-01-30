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
    t = User.topics.count
    c = User.comments.count
    @total = t + c
  end

  def spawn
    case add_posts #or @total??????????
    when 5
      generate_dragon
    end
  end




  

end
