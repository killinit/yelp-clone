require 'spec_helper'

describe "Editing restaurants" do
  
  before(:each) do
    visit '/users/sign_up'
    fill_in 'Email', with: 'a@a.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'

    Restaurant.create(name: 'Sushi Stop', description: "The best sushi in town")
    visit('/restaurants')
  end

  it 'should be able to edit a record' do
    click_link('Edit')
    fill_in 'Description', with: 'The second best sushi in town'
    click_button('Update')
    expect(page).to have_content('The second best sushi in town')
  end

  it "should be able to delete a record" do
    click_link('Delete')
    expect(page).not_to have_content('The second best sushi in town')
  end
end