require 'spec_helper'

describe 'Answer Panel' do
  context 'can create/edit answers if logged in' do
    it 'can create an answer associated with a particular question and view it' do
      add_user_mock

      visit root_url

      click_link 'sign_in'

      question = Question.create(title: "How do I eat bacon?",
                                 content: "I'm really struggling with bacon" )

      visit question_url(question)

      expect {
        fill_in 'answer_content', with: "You put it in your mouth, man.  It's pretty simple."
        click_button 'Save'
      }.to change(Answer, :count).by 1

      User.find_by_uid("twitter-12345").answers.count.should eq 1

      page.should have_content "You put it in your mouth, man.  It's pretty simple."
    end
  end

  context 'cannot create/edit answers if logged in' do
    it 'cannot create an answer unless logged in' do
      question = Question.create(title: "How do I eat bacon?",
                                 content: "I'm really struggling with bacon" )

      visit question_url(question)

      expect {
        fill_in 'answer_content', with: "You put it in your mouth, man.  It's pretty simple."
        click_button 'Save'
      }.to change(Answer, :count).by 0

      page.should have_content "Please Log In To Create An Answer"
    end
  end
end
