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

      save_and_open_page

      page.should have_content "How do I eat bacon?"
    end
  end
end
