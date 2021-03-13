class QuizzesController < ApplicationController
  before_action :require_logged_in
  before_action :owns_quiz, except: [:index, :new, :create]

  def index
    #find all quizzes that belong to user of current session
    @quizzes = current_user.quizzes
  end

  def show
    #shows individual quiz and links to let edit and delete
    #how to belong to user
    @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = Quiz.new(host_id: current_user.id)
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to quiz_path(@quiz)
    else
      redirect_to new_quiz_path
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    @quiz.title = quiz_params[:title]
    if @quiz.save
      redirect_to quiz_path(@quiz)
    else
      redirect_to edit_quiz_path(@quiz)
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :host_id)
  end 

  def owns_quiz
    @quiz = Quiz.find(params[:id])
    redirect_to '/home' unless @quiz.host == current_user
  end
end
