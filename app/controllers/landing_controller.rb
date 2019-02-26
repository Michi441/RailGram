class LandingController < ApplicationController
  before_action :signed_in? 
  def welcome
  end

  def signin
  end





  private

  def signed_in?
    if user_signed_in?
      redirect_to user_path(current_user)
    end
  end
end
