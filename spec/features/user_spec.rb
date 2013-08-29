require 'spec_helper'

describe "User sign up or sign in" do
  context "when on index page and not in session" do
    it "user can sign in with twitter" do
      OmniAuth.config.add_mock :twitter, uid: "twitter-12345", info: { name: "Nedliest Catch" }
      visit root_path
      find(".twitter-button").click
      page.should have_content "Welcome back Nedliest Catch"
    end
    it "should have a signout link" do
      page.should have_selector('a', text: 'Logout')
    end
  end
end
