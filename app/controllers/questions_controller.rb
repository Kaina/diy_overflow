class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    puts params
    question = Question.create(params[:question])
    redirect_to question_url(question)
  end

  def show
    puts "GOT HERE< <> >"
    @question = Question.find(params[:id])
  end
end
