class RoundsController < ApplicationController

  # need a before_action that checks they have ability to edit that quiz

  def new
    quiz = Quiz.find(params[:quiz_id])
    @round = quiz.rounds.build()
  end

  def create 
    @round = Round.new(round_params)
    if @round.save
      redirect_to edit_quiz_path(@round.quiz_id)
    else
      redirect_to new_round_path(:quiz_id => round_params[:quiz_id])
    end
  end

  def edit
  end

  def update
  end

  private
  def round_params
    params.require(:round).permit(:subject, :quiz_id)
  end 
end
