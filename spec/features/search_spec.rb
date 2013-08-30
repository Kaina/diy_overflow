require 'spec_helper'

describe 'Search Panel' do
  context 'a user can search for questions anonymously' do
  	let!(:question) {FactoryGirl.create(:question)}
  	it "can search for question by title" do
  	  visit root_path
  	  page.should have_content "Search"
    end
  end
end