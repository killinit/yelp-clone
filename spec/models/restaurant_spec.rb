require 'spec_helper'

describe Restaurant do
  describe '.average_rating' do
    # create(:restaurant)
    let(:restaurant) { Restaurant.create!(name: "Hello", description: 'The food here is totally awesome blah blah!') }

    context 'no ratings' do
      it "should return 'Unrated' if unrated" do
        expect(restaurant.average_rating).to eq('Unrated')
      end
    end

    context 'a single rating' do
      it 'returns that rating' do
        restaurant.reviews << Review.new(ratings: 3, body: 'a', name: 'b')

        expect(restaurant.average_rating).to eq 3
      end
    end

    context 'multiple ratings' do
      it "should return an average of ratings" do
        restaurant.reviews << Review.new(ratings: 2, body: 'a', name: 'b')
        restaurant.reviews << Review.new(ratings: 4, body: 'a', name: 'b')

        expect(restaurant.average_rating).to eq(3)
      end
    end
  end
end
