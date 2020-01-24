class User < ActiveRecord::Base

  attr_accessor [only: :topics, :comments, :dragons]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :topics
  has_many :comments
  has_many :dragons
  has_one_attached :avatar

  def initialize
    @user = User.find_by_id(params[:user_id])
  end

  def post_count
    c = @user.comments.count
    t = @user.topics.count
    total = c + t
  end

end
