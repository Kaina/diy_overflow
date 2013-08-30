require 'spec_helper'

describe "User can auth" do
  context "when user signs in with twitter" do
    it "signs the user in and welcomes them" do
      OmniAuth.config.add_mock :twitter,
                               uid: "twitter-12345",
                               info: { nickname: "Nedliest Catch",
                                       image: "imageofned.html" },
                               credentials: { token: "1234549039jrf0a",
                                              secret: "aoiefnaewofianefo" }
      visit root_url
      click_link "sign_in"
      page.should have_content "Welcome back Nedliest Catch"
      page.should have_content('Logout')
    end

    it "signs the user out upon clicking log out" do
      visit '/auth/twitter'
      click_link "Logout"
      page.should have_css("a#sign_in")
    end
  end
end

describe "User can view content" do
  context "a user can view content" do
    let!(:question) {FactoryGirl.create(:question)}
    it "should display content when user is logged out" do
      visit root_path
      page.should have_selector('.twitter-button')
      page.should have_selector('#question')
    end

    it "should display content when user is logged in" do
      visit '/auth/twitter'
      page.should have_selector('a', text: 'Logout')
      page.should have_selector('#question')
    end
  end
end

describe "User can click on a question" do
  context "a user clicks on a question" do
    let!(:question) {FactoryGirl.create(:question)}
    it "should display the question content" do
      visit root_path
      click_link "How do I build this awesome couch?"
      page.should have_content("Like this:")
    end
  end
end

describe "User can upload an image to a question" do
  context "a user clicks to submit an image" do
    it "should display the image on page" do
      visit new_question_url

      fill_in 'question_title',   with: "how do i eat bacon?"
      fill_in 'question_content', with: "i'm really struggling with bacon"
      attach_file('my_test_image', '/assets/my_test_image.png')
      click_button 'save'

      page.should have_content("#question_image")
    end
  end
end
