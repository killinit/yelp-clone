require 'spec_helper'

describe "editing reviews" do

  before(:each) do
    restaurant = Restaurant.create(name: 'Bam Bam Sushi', description: 'Test restaurant', id: '5')
    restaurant.reviews << Review.create(name: "Wilbur", body: "I love it")
    visit '/restaurants/5'
  end

  it "should be able to delete reviews" do
    click_link('Delete Review')
    expect(page).not_to have_content('I love it')
  end

  it "should be able to edit reviews" do
    click_link('Edit')
    fill_in('Review', with: "The second best sushi in town")
    click_button('Update')
    expect(page).to have_content('The second best sushi in town')
  end
end