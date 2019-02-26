class Post < ApplicationRecord
    include PublicActivity::Model
    tracked owner: Proc.new { |controller, model| controller && controller.current_user }
    belongs_to :user
    has_many :comments
    has_many_attached :images
    acts_as_votable
    validates :title, presence: true, length: { maximum: 50}
    validates :description, presence: true, length: { maximum: 800}


end
