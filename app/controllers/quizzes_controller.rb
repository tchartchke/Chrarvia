class QuizzesController < ApplicationController
  before_action :require_logged_in

  def index
    #shows all quizzes current user has created - has link to make new quiz
    # raise current_user.quizzes.inspect

    #find all quizzes that belong to user of current session
    @quizzes = current_user.quizzes
  end

  def show
    #shows individual quiz and links to let edit and delete
    #how to belong to user
    @quiz = Quiz.find(params[:id])

    redirect_to '/home' unless @quiz.host == current_user
  end

  def new
    @user = current_user
    @quiz = Quiz.new(host_id:@user.id)
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to user_quiz_path(current_user, @quiz)
    else
      redirect_to new_user_quiz_path(current_user)
    end
  end
  
  private

  def quiz_params
    params.require(:quiz).permit(:title, :host_id)
  end 
end
