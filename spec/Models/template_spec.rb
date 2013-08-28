require 'spec_helper'

describe Template do
  let(:template) { Template.new(title: "Bacon?",
                                content: "I can't bacon.",
                                author: "A Pig") }

  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:author) }
end
