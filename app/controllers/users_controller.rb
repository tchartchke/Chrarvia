class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    if session[:user_id]
      redirect_to home_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def home
    if session[:user_id]
      @user = User.find(session[:user_id])
      render :home
    else
      redirect_to new_user_path
    end
  end
end