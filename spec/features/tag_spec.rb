require 'spec_helper'

describe 'Tag system' do
  context 'Create Tag' do
  	it 'can create a tag with a question and view it' do
  	  visit new_question_url

  	  expect {
  	  	fill_in 'question_title', with: "How do I make a samurai sword?"
  	  	fill_in 'question_content', with: "It seems really hard."
  	  	fill_in 'question_tag_names', with: "swords"
  	  	click_button 'Save'
  	  }.to change(Tag, :count).by 1

  	  page.should have_content "swords"
  	end
  end

  context 'Edit Question' do
    it 'can edit existing tags and view the successful changes' do
      question = Question.create(title: "How do I make a samurai sword?", content: "It seems hard", tag_names: "swordfish")

      visit edit_question_url(question)
      
      save_and_open_page

      page.should have_css("input[value]#question_tag_names", "sword")

      fill_in 'question_tag_names', with: "SWORDS"
      click_button 'Save'

      page.should have_content "SWORDS"
    end
  end
end