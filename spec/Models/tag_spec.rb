require 'spec_helper'

describe Tag do
  let!(:tag) {FactoryGirl.create(:tag)}
  
  it 'has a valid factory' do
    tag.should be_valid
  end	
end