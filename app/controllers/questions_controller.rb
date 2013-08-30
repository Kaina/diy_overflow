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
    question = current_user.questions.create(params[:question])
    redirect_to question_url(question)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @comment = Comment.new
  end

  def edit
    question = Question.find(params[:id])
    if current_user == question.user
      @question = question
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
