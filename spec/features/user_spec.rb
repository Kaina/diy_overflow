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
