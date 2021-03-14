class RoundsController < ApplicationController

  # need a before_action that checks they have ability to edit that quiz

  def new
    @round = Round.new(quiz_id: params[:quiz_id])
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
    @round = Round.find(params[:id])
    @round.questions.build(question: 'Add a new question to the round')
  end

  def update
    @round = Round.find(params[:id])
    @round.update(round_params)
    redirect_to edit_round_path(@round)
  end

  private
  def round_params
    params.require(:round).permit(
      :subject, 
      :quiz_id,
      questions_attributes: [
        :question,
        :answer,
        :points
      ])
  end 

end