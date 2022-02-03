class OrdersController < ApplicationController

  def create
    @authors_book = AuthorsBook.find(params[:authors_book_id]
    current_quantity = @authors_book.book.quantity
    return if current_quantity < 1

    @order = Order.new(authors_book: @authors_book, user: current_user)
    if @order.save
      @authors_book.book.update(quantity: current_quantity - 1)
      redirect_to authors_books_path, notice: "The book was added to shopping cart"
    end
  end
end
