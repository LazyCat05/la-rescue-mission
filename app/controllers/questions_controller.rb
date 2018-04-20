class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @questions = Question.order("created_at DESC").all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:alert] = 'Question saved.'
      redirect_to '/questions'
    else
      errors = @question.errors.full_messages
      flash[:alert] = errors.join(' ')
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)
    if @question.save
      flash[:alert] = 'Question updated.'
      redirect_to question_path(@question)
    else
      errors = @question.errors.full_messages
      flash[:alert] = errors.join(' ')
      render :edit
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.answers.each do |answer|
      answer.delete
    end
    question.delete
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end

end
