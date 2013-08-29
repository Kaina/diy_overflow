require 'spec_helper'

describe "User can auth" do
  context "when user signs in with twitter" do
    it "signs the user in and welcomes them" do
      OmniAuth.config.add_mock :twitter, uid: "twitter-12345", info: { name: "Nedliest Catch" }
      visit '/auth/twitter'
      page.should have_content "Welcome back Nedliest Catch"
    end
    it "should display a logout link" do
      visit '/auth/twitter'
      page.should have_selector('a', text: 'Logout')
    end
  end
end
