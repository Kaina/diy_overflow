require 'spec_helper'

describe 'Comment Panel' do
	context 'can create/edit comments if logged in' do
		it 'can create a comment associated with a particular question and view it' do
			OmniAuth.config.add_mock :twitter,
															 uid: "twitter-12345",
															 info: { nickname: "Nedliest Catch",
															 					image: "imageofned.html"},
															 credentials: { token: "1234549039jrf0a",
															 								secret: "aoiefnaewofianefo" }
			visit root_url

			click_link 'sign_in'

			question = Question.create(title: "This is my question?",
															 content: "I think is my question?" )

			visit question_url(question)

			expect {
				fill_in 'comment_content', with: "I'm totally a comment content body."
				click_button 'Save'
			}.to change(Comment, :count).by 1

			User.find_by_uid("twitter-12345").comments.count.should eq 1

			page.should have_content "I'm totally a comment content body."
		end
	end

	context 'cannot create/edit comments if not logged in' do
    it 'cannot create an comment unless logged in' do
      question = Question.create(title: "How do I eat bacon?",
                                 content: "I'm really struggling with bacon" )

      visit question_url(question)

      expect {
        fill_in 'comment_content', with: "I'm totally a comment content body."
        click_button 'Save'
      }.to change(Comment, :count).by 0

      page.should have_content "Please Log In To Create A Comment"
    end
  end

end