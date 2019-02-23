class NewsfeedsController < ApplicationController
  def index
    @activities = PublicActivity::Activity.where(:owner_id => current_user.following_users, :owner_type => 'User').order('created_at DESC')
  end
end
