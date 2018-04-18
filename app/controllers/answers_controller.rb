class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question_id = @question.id

    if @answer.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:description)
  end

end
