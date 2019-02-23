class Post < ApplicationRecord
    include PublicActivity::Model
    tracked owner: Proc.new { |controller, model| controller && controller.current_user }
    belongs_to :user
    has_many_attached :images
end
