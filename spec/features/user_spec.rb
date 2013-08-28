require 'spec_helper'

describe "User sign up or sign in" do
  context "when on the sign up page" do
    it "should have a sign in with twitter link" do
      visit signin_path
      click_link "Sign in with Twitter"
    end
  end
end