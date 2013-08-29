class QuestionsController < ApplicationController
  def new
    if current_user
      @question = Question.new
    else
      flash[:notice] = "Please Log In To Create A Question"
      redirect_to root_url
    end
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
    if current_user
      @question = Question.find(params[:id])
    else
      flash[:notice] = "Please Log In To Edit Question"
      redirect_to root_url
    end
  end

  def update
    question = Question.find(params[:id])
    question.update_attributes(params[:question])
    redirect_to question_url(question)
  end
end
