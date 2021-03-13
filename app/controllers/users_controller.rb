class UsersController < ApplicationController
  def new
    if session[:user_id]
      redirect_to 'home'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def home

  end
end