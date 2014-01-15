require 'spec_helper'

describe 'adding a restaurant' do
  before(:each) do
    visit '/users/sign_up'
    fill_in 'Email', with: 'a@a.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'
  end
  
  context 'give a name and a description' do
    it "should display the new restaurant" do
      visit '/restaurants/new'
      fill_in 'Name', with: 'Plenty of Sushi'
      fill_in 'Description', with: 'Om nom nom'

      click_button 'Add restaurant'

      expect(current_path).to eq '/restaurants'
      expect(page).to have_content('Plenty of Sushi')
    end
  end


  context 'without a name or a description' do
    it "should throw an error" do
      visit '/restaurants/new'

      click_button 'Add restaurant'

      expect(page).to have_content('error')
    end
  end

end