require 'rails_helper'

describe "Visitor visits '/books'" do
  it 'sees all book title in the database and each title is a link to the book show page' do
    book_1 = Book.create(title: 'Call of the Wild')
    book_2 = Book.create(title: 'Catch 22')
    user = User.create(name: 'Colin')
    review_1 = book_1.reviews.create(body: 'This is a review', rating: 5, user_id: user.id)
    review_2 = book_2.reviews.create(body: 'This is also a review', rating: 4, user_id: user.id)

    visit books_path

    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_2.title)

    click_on book_1.title

    expect(current_path).to eq(book_path(book_1))
  end
end
