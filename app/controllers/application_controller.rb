class ApplicationController < ActionController::Base
  def welcome
    
  end
  def current_user
    User.find_by(id: session[:user_id])
  end
  
  private 
  
  def require_logged_in
    redirect_to '/signin' unless current_user
  end
end
