class AnswersController < ApplicationController
  def create
    question.answers.create(params[:answer])
    redirect_to question_url(question)
  end
end
