class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
    @average_rating = @book.average_rating
    @highest_rating = @book.highest_rated_review.first.rating
    @highest_rating_user = @book.highest_rated_review.first.user.name
    @highest_rating_body = @book.highest_rated_review.first.body
    @lowest_rating = @book.lowest_rated_review.first.rating
    @lowest_rating_user = @book.lowest_rated_review.first.user.name
    @lowest_rating_body = @book.lowest_rated_review.first.body
    
  end
end
