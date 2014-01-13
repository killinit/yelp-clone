require 'spec_helper'

describe "reviews module" do

  before(:each) do
    Restaurant.create(name: 'T1', description: 'Test restaurant')
  end

  it "can add a review for a pre-existing restaurant" do
    visit '/restaurants'
    click_link('add review')
    fill_in 'Review', with: 'here is a test review'
    click_button('submit')
    expect(current_path).to be('/restaurants')
    expect(page).to have_content('here is a test review')
  end

end