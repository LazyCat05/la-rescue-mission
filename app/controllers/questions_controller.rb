class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @questions = Question.order("created_at DESC").all
  end

  def show
    @question = Question.find(params[:id])
  end
end
