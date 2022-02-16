class OrdersController < ApplicationController

  def create
    # I don't think that it's a good idea to use the joined table
    # publicly. We should pass the book ID here instead. Besides that,
    # it should be possible to add several books to an order, so we need
    # something like OrderItem
    # Also, no need to use instance variable. A local variable is enough
    @authors_book = AuthorsBook.find(params[:authors_book_id])
    current_quantity = @authors_book.book.quantity
    return if current_quantity < 1 # Why not current_quantity.zero?

    # Probably makes sense to use current_users.orders.build
    @order = Order.new(authors_book: @authors_book, user: current_user)
    authorize @order
    # @order.save and book.update need to be wrapped into a transaction,
    # because otherwise it might happen that the order was saved, but the
    # quantity of the books wasn't updated
    if @order.save
      @authors_book.book.update(quantity: current_quantity - 1)
      redirect_to authors_books_path, notice: "The book was added to shopping cart"
    # What happens if the order isn't saved?
    end
  end

  def destroy
    # Instead of using authorization here, can be more straightforward:
    # current_user.orders.find(params[:id]).destroy
    @order = Order.find(params[:id])
    authorize @order
    @order.destroy
    redirect_to shopping_cart_path, notice: "Successfully removed!"
  end
end
