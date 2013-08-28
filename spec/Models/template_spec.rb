require 'spec_helper'

describe Template do
  let(:template) { Template.new(title: "Bacon?",
                                content: "I can't bacon.",
                                author: "A Pig") }

  it "shouldn't initialize with less than three variables" do
    expect( Template.new ).to raise_error(ArgumentError)
  end
end
