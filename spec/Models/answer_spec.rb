require 'spec-helper'

describe Answer do 
	let(:answer) { Answer.new(content: "il<3 bacon",
														parent_id: 1)}
	
	it "should have a parent" do 
		expect(answer.parent).to eq 1
	end 

	it 'should return content'
	 answer.content.should eq 'il<3 bacon'
	end 
end 




