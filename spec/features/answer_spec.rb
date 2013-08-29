require 'spec_helper'

describe 'Answer Panel' do
  context 'Create Answer' do
    it 'can create an answer associated with a particular question and view it' do
      question = Question.create(title: "How do I eat bacon?", content: "I'm really struggling with bacon" )

      visit question_url(question)
      expect {
        fill_in 'answer_content', with: "You put it in your mouth, man.  It's pretty simple."
        click_button 'Save'
      }.to change(Answer, :count).by 1

      page.should have_content "You put it in your mouth, man.  It's pretty simple."
    end
  end
end
