require 'spec_helper'

describe 'Question panel, User Logged In' do
  context 'Create Question' do
    it 'can create a new question and view it' do
      OmniAuth.config.add_mock :twitter,
                               uid: "twitter-12345",
                               info: { nickname: "Nedliest Catch",
                                       image: "imageofned.html" },
                               credentials: { token: "1234549039jrf0a",
                                              secret: "aoiefnaewofianefo" }

      visit root_url

      click_link 'sign_in'

      visit new_question_url

      expect {
        fill_in 'question_title',   with: "How do I eat bacon?"
        fill_in 'question_content', with: "i'm really struggling with bacon"
        click_button 'Save'
      }.to change(Question, :count).by 1

      page.should have_content "How do I eat bacon?"
    end
  end

  context 'Edit Question' do
    it 'can edit an existing question and view the successful changes' do
      question = Question.create(title: "Bacon?", content: "I can't bacon." )

      OmniAuth.config.add_mock :twitter,
                               uid: "twitter-12345",
                               info: { nickname: "Nedliest Catch",
                                       image: "imageofned.html" },
                               credentials: { token: "1234549039jrf0a",
                                              secret: "aoiefnaewofianefo" }

      visit root_url

      click_link 'sign_in'

      visit edit_question_url(question)

      fill_in 'question_title', with: "Bacon."
      click_button 'Save'

      page.should have_content "Bacon."
    end
  end
end

describe 'Question panel, User Anonymous' do
  it 'Cannot create a question' do
    visit new_question_url

    page.should have_content "Please Log In"

    page.should have_css 'a#sign_in'
  end

  it 'Cannot edit a question unless logged in' do
    question = Question.create(title: "Bacon?", content: "I can't bacon." )

    visit edit_question_url(question)

    page.should have_content "Please Log In To Edit Question"
  end
end
