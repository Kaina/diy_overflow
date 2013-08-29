class AnswersController < ApplicationController
  def new
    @question = Question.find
  end

  def create
    question = Question.find(params[:id])
    question.answers.create(params[:answer])
    redirect_to question_url(question)
  end
end
