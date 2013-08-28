require 'spec_helper'

feature 'User browsing the website' do
  context "on index page" do
  	it "sees a sign in button" do
  	  visit "/"
  	  page.has_content?("Sign in")	
  	end
  end	
end