require 'spec_helper'

describe "User sign up or sign in" do
  context "when on index page and not in session" do
    it "should have a sign in with twitter link" do
      visit root_path
      find(".twitter-button").click
    end
  end
end
