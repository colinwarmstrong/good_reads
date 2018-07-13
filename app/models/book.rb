class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average(:rating)
  end

  def highest_rated_review
    reviews.order(rating: :desc).limit(1)
  end

  def lowest_rated_review
    reviews.order(:rating).limit(1)
  end
end
