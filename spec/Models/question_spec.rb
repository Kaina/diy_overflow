require 'spec_helper'

describe Question do
  let(:question) { Question.new(title: "Bacon?",
                                content: "I can't bacon.") }

  it "should not have a parent" do
    expect(question.parent).to be_nil
  end

  it { should have_many(:answers) }
end
