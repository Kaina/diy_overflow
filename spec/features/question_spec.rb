require 'spec_helper'

describe 'Question panel' do
  context 'Create Question' do
    it 'can create a new question and view it' do
      visit new_question_url

      expect {
        fill_in 'question_title',   with: "How do I eat bacon?"
        fill_in 'question_content', with: "i'm really struggling with bacon"
        click_button 'Create Question'
      }.to change(Question, :count).by 1

      page.should have_content "How do I eat bacon?"
    end
  end

  context 'Edit Question' do
    it 'can edit an existing question and view the successful changes' do
      question = Question.create(title: "Bacon?", content: "I can't bacon." )

      visit edit_question_url(question)

      fill_in 'question_title', with: "Bacon."
      click_button 'Edit Question'

      page.should have_content "Bacon."
    end
  end
end
