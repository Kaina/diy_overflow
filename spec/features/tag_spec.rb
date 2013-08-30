require 'spec_helper'

describe 'Question panel' do
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
end