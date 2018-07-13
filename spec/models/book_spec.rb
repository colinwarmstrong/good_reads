require 'rails_helper'

describe Book, type: :model do
  describe 'instance methods' do
    it '#average_rating' do
      book = Book.create(title: 'Call of the Wild')
      user = User.create(name: 'Colin')
      review_1 = book.reviews.create(body: 'This is a review', rating: 5, user_id: user.id)
      review_2 = book.reviews.create(body: 'This is a also review', rating: 4, user_id: user.id)
      review_3 = book.reviews.create(body: 'And this is also a review', rating: 3, user_id: user.id)

      expect(book.average_rating).to eq(4)
    end

    it '#highest_rating' do
      book = Book.create(title: 'Call of the Wild')
      user = User.create(name: 'Colin')
      review_1 = book.reviews.create(body: 'This is a review', rating: 4, user_id: user.id)
      review_2 = book.reviews.create(body: 'This is a also review', rating: 2, user_id: user.id)
      review_3 = book.reviews.create(body: 'And this is also a review', rating: 1, user_id: user.id)

      expect(book.highest_rated_review).to eq([review_1])
    end

    it '#lowest_rating' do
      book = Book.create(title: 'Call of the Wild')
      user = User.create(name: 'Colin')
      review_1 = book.reviews.create(body: 'This is a review', rating: 4, user_id: user.id)
      review_2 = book.reviews.create(body: 'This is a also review', rating: 2, user_id: user.id)
      review_3 = book.reviews.create(body: 'And this is also a review', rating: 1, user_id: user.id)

      expect(book.lowest_rated_review).to eq([review_3])
    end
  end
end
