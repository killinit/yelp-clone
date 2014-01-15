class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  validates :name, presence: true
  validates :body, presence: true #, length: { minimum: 30 }
  validates :ratings, inclusion: { in: :valid_ratings.to_proc, message: 'must be selected'}

  def valid_ratings
    restaurant && restaurant.promoted? ? 1..5 : 1..4
  end
end
