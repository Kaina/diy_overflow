
class AnswersController < ApplicationController
	def create
    question = Question.find(params[:answer][:question_id])

    if current_user
  		question.answers.create(content: params[:answer][:content], user: current_user)
    else
      flash[:notice] = "Please Log In To Create An Answer"
    end

    redirect_to question_url(question)
	end
end
