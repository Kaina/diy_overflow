require 'spec_helper'

describe 'Answer' do 
  context 'Create Answer' do 
    visit new_answer_url 
    

    fill_in 'answer_content', with: 'Obvi it is the best food evs.'
    click_button 'Save'
    # this also needs to go back to the show page 
  end 

end 

