class UsersController < ApplicationController
  autocomplete :user, :username


  def index
    if params[:search]
      @user = User.where('username LIKE ?', "%#{params[:search]}").order('username')
        if @user.exists?
          redirect_to user_path(@user.ids)
        else
          flash[:alert] = "The User #{params[:search]} was not found"
          @user = User.find(params[:id])
          redirect_to @user
        end

    end
  end
  def show
    @user = User.find(params[:id])
    @posts = @user.posts


    if params[:search]
      @user = User.where('username LIKE ?', "%#{params[:search]}").order('username')
        if @user.exists?
          redirect_to user_path(@user.ids)
        else
          flash[:alert] = "The User #{params[:search]} was not found"
          @user = User.find(params[:id])
          redirect_to @user
        end

    end
  end






  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to @user
  end


  
  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to @user
  end
end
