class QuizzesController < ApplicationController
  before_action :require_logged_in

  def index
    #shows all quizzes current user has created - has link to make new quiz
    
  end

  def show
    #shows individual quiz and links to let edit and delete
  end

  def new
    #createa a new quiz
  end

  def create
    # 
  end
end
