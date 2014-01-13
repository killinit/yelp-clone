require 'spec_helper'

describe "reviews module" do

  before(:each) do
    Restaurant.new(name: 'T1', description: 'Test restaurant')
  end

  it "can add a review for a pre-existing restaurant" do
    visit '/restaurants'
    click_button 'add review'
    fill_in 'review', with: 'here is a test review'
    expect(current_path).to be('/restaurants')
    expect(page).to have_content('here is a test review')
  end

end