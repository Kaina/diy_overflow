class CommentsController < ApplicationController
	def create
    question = Question.find(params[:comment][:question_id])

    if current_user
  		question.comments.create(content: params[:comment][:content], user: current_user)
    else
      flash[:notice] = "Please Log In To Create A Comment"
    end

    redirect_to question_url(question)
	end
end
