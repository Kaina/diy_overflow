class CommentsController < ApplicationController
	def create
		type = params[:comment_type]
		if comment.type == 'question'
    	question = Question.find(params[:comment][:question_id])
	    if current_user
	  		question.comments.create(content: params[:comment][:content], user: current_user)
	    else
	      flash[:notice] = "Please Log In To Create A Comment"
	    end
	  else comment.type == 'answer'
	  	answer = Answer.find(params[:comment][:an_id])
	    if current_user
	  		question.comments.create(content: params[:comment][:content], user: current_user)
	    else
	      flash[:notice] = "Please Log In To Create A Comment"
	    end
	  end

    redirect_to question_url(question)
	end
end
