class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    question = Question.create(params[:question])
    redirect_to question_url(question)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update_attributes(params[:question])
    redirect_to question_url(question)
  end

  def upvote 
    question = Question.find(params[:id])
    question.update_attribute(:votes,(question.votes + 1))
    redirect_to question_url(question)
  end
end
