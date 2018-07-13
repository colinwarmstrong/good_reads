require 'rails_helper'

describe "Visitor visits '/book/:id'" do
  it 'sees the book title and a list of reviews associated with that book' do
    book = Book.create(title: 'Call of the Wild')
    user = User.create(name: 'Colin')
    review_1 = book.reviews.create(body: 'This is a review', rating: 5, user_id: user.id)
    review_2 = book.reviews.create(body: 'This is also a review', rating: 4, user_id: user.id)

    visit book_path(book)

    expect(page).to have_content(book.title)
    expect(page).to have_content(review_1.body)
    expect(page).to have_content(review_1.user.name)
    expect(page).to have_content(review_2.body)
    expect(page).to have_content(review_2.user.name)
  end

  it 'sees the rating that each user gave the book as part of their review' do
    book = Book.create(title: 'Call of the Wild')
    user = User.create(name: 'Colin')
    review = book.reviews.create(body: 'This is a review', rating: 5, user_id: user.id)

    visit book_path(book)

    expect(page).to have_content("Rating: #{review.rating}")
  end

  it 'sees the average rating for the book' do
    book = Book.create(title: 'Call of the Wild')
    user = User.create(name: 'Colin')
    review_1 = book.reviews.create(body: 'This is a review', rating: 5, user_id: user.id)
    review_2 = book.reviews.create(body: 'This is a also review', rating: 4, user_id: user.id)
    review_3 = book.reviews.create(body: 'And this is also a review', rating: 3, user_id: user.id)

    visit book_path(book)

    expect(page).to have_content("Average Rating: 4")
  end

  it 'sees the highest rating for the book and the review associated with that rating' do
    book = Book.create(title: 'Call of the Wild')
    user = User.create(name: 'Colin')
    review_1 = book.reviews.create(body: 'This is a review', rating: 4, user_id: user.id)
    review_2 = book.reviews.create(body: 'This is a also review', rating: 2, user_id: user.id)
    review_3 = book.reviews.create(body: 'And this is also a review', rating: 1, user_id: user.id)

    visit book_path(book)

    within('.highest-subheader') do
      expect(page).to have_content("Highest Rating: 4")
      expect(page).to have_content(review_1.body)
      expect(page).to have_content(review_1.user.name)
    end
  end

  it 'sees the lowest rating for the book and the review assocaited with that rating' do
    book = Book.create(title: 'Call of the Wild')
    user = User.create(name: 'Colin')
    review_1 = book.reviews.create(body: 'This is a review', rating: 4, user_id: user.id)
    review_2 = book.reviews.create(body: 'This is a also review', rating: 2, user_id: user.id)
    review_3 = book.reviews.create(body: 'And this is also a review', rating: 1, user_id: user.id)

    visit book_path(book)

    within('.lowest-subheader') do
      expect(page).to have_content("Lowest Rating: 1")
      expect(page).to have_content(review_3.body)
      expect(page).to have_content(review_3.user.name)
    end
  end
end
