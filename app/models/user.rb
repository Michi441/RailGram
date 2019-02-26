class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :username, presence: true, length: { maximum: 30 }
  validates :bio, length: { maximum: 500 }  

  has_many :posts
  has_many :comments
  acts_as_follower
  acts_as_followable
  acts_as_voter



end
