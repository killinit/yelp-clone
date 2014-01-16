class Restaurant < ActiveRecord::Base
  has_many :reviews
  validates :name, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :description, presence: true

  def average_rating
    reviews.average('ratings') || 'Unrated'
    # return 'Unrated' if reviews.none?

    # total = reviews.reduce(0) {|sum, review|
    #   sum += review.ratings
    # }
    # (total / reviews.length)
  end

end
