require 'spec_helper'

describe Tag do
  let!(:tag) {FactoryGirl.create(:tag)}
  
  it 'has a valid factory' do
    tag.should be_valid
  end
  it 'is invalid without a name' do
    FactoryGirl.build(:tag, name: nil).should_not be_valid
  end	
  it 'has many question_tags' do
  	should have_many(:question_tags)
  end
  it 'has many questions through question_tags' do
  	should have_many(:questions).through(:question_tags)
  end
end