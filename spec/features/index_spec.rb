require '../spec_helper.rb'

feature 'User browsing the website' do
  context "on index page" do
  	it "sees a sign in button" do
  	  visit root_path
  	  page.has_content?("Sign in")	
  	end
  end	
end