class Review < ActiveRecord::Base
  belongs_to :restaurant
  validates :name, presence: true
  validates :body, presence: true, length: { minimum: 30 }
  validates :ratings, inclusion: { in: 1..5, message: 'must be selected'}
end
