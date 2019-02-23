class NewsfeedsController < ApplicationController

  before_action :check_user

  def index
    @activities = PublicActivity::Activity.where(:owner_id => current_user.following_users, :owner_type => 'User').order('created_at DESC')
  end




  private


  def check_user
    @user = User.find(params[:user_id])
    if current_user.id == @user.id

    else
      redirect_to @user
    end
  end



 

 





  
end
