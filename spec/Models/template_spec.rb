require 'spec_helper'

describe Template do
  let(:template) { Template.new( title: "Bacon?",
                                content: "I can't bacon.") }

  it { should belong_to(:parent) }
  it { should have_many(:children) }

  it { should validate_presence_of(:content) }

  it 'has no votes when created' do 
  	template.votes.should eq 0 
  end 

end
