require 'spec_helper'

describe Restaurant do
  describe '.average_rating' do

    let(:restaurant) { Restaurant.new(name: "Hello") }

    context 'no ratings' do
      it "should return 'Unrated' if unrated" do
        expect(restaurant.average_rating).to eq('Unrated')
      end
    end

    context 'a single rating' do
      it 'returns that rating' do
        restaurant.reviews << Review.new(ratings: 3)

        expect(restaurant.average_rating).to eq 3
      end
    end

    context 'multiple ratings' do
      it "should return an average of ratings" do
        restaurant.reviews << Review.new(ratings: 5)
        restaurant.reviews << Review.new(ratings: 7)

        expect(restaurant.average_rating).to eq(6)
      end
    end
  end
end
