require 'spec_helper'

describe User do
  let!(:user) {FactoryGirl.create(:user)}

  it 'has a valid factory' do
    user.should be_valid
  end
  it 'is invalid without a nickname' do
    FactoryGirl.build(:user, nickname: nil).should_not be_valid
  end
  it 'is invalid without a provider' do
    FactoryGirl.build(:user, provider: nil).should_not be_valid
  end
  it 'should not allow duplicate entries' do
    FactoryGirl.build(:user, nickname: "gershbag", provider: "twitter",
                image: "http://www.example.com", uid: "123456789",
                token: "akjslhf93904u1lhasfkjdakjsdf",
                secret: "asksdkkaffdjhf03u45jhdkfgls").should_not be_valid
  end
  it 'has many questions' do
    should have_many(:questions)
  end
  it 'has many answers' do
    should have_many(:answers)
  end
end
