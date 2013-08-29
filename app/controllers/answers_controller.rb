class AnswersController < ApplicationController
	
	def new 
		@answer = Answer.new
	end 

	def create
		@answer = Answer.new(params[:answer])
		@answer.save
		redirect_to 'questions/show'
	end 




end 