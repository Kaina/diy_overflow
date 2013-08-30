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
        fill_in 'question_content', with: "I'm really struggling with bacon"
        fill_in 'question_tag_names', with: "pigs bacon"
        click_button 'Save'
      }.to change(Question, :count).by 1

      Question.last.tags.count.should eq 2

      page.should have_content "How do I eat bacon?"
      page.should have_content "I'm really struggling with bacon"
      page.should have_content "pigs"
      page.should have_content "bacon"
    end
  end

  context 'Edit Question' do
    it 'can edit an existing question and view the successful changes' do
      OmniAuth.config.add_mock :twitter,
                               uid: "twitter-12345",
                               info: { nickname: "Nedliest Catch",
                                       image: "imageofned.html" },
                               credentials: { token: "1234549039jrf0a",
                                              secret: "aoiefnaewofianefo" }
      visit root_url

      click_link 'sign_in'

      current_user = User.find_by_uid("twitter-12345")

      question = current_user.questions.create( title: "Bacon?",
                                                content: "I can't bacon.",
                                                tag_names: "pigs bacon" )

      visit question_url(question)

      click_link 'Edit'

      page.should have_css("input[value]#question_tag_names", "pigs bacon")

      expect {
        fill_in 'question_title', with: "Bacon."
        fill_in 'question_tag_names', with: "food"
        click_button 'Save'
      }.to change(Tag, :count).by 1

      page.should have_content "Bacon."
      page.should have_content "food"
      page.should_not have_content "Bacon?"
      page.should_not have_content "pigs"
    end
  end
end

describe 'Question panel, User Anonymous' do
  it 'cannot create a question' do
    visit new_question_url

    page.should have_content "Please Log In"

    page.should have_css 'a#sign_in'
  end

  it 'cannot edit a question unless logged in' do
    user = User.new
    user.nickname = "Jim"
    user.provider = "twitter"
    user.save
    question = Question.create(title: "Bacon?", content: "I can't bacon.", user: user)

    visit edit_question_url(question)

    page.should have_content "Please Log In To Edit Question"
  end

  it 'cannot edit a post unless it created the post' do
    user = User.new
    user.nickname = "Jim"
    user.provider = "twitter"
    user.save
    question = Question.create(title: "Bacon?", content: "I can't bacon.", user: user)

    OmniAuth.config.add_mock :twitter,
                               uid: "twitter-12345",
                               info: { nickname: "Nedliest Catch",
                                       image: "imageofned.html" },
                               credentials: { token: "1234549039jrf0a",
                                              secret: "aoiefnaewofianefo" }
    visit root_url

    click_link 'sign_in'

    visit edit_question_url(question)

    page.should have_content "Please Log In To Edit Question"
  end
end
