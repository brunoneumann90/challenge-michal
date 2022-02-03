class BooksController < ApplicationController
  before_action :set_book, only: %i[edit update]

  def edit
    authorize @book
  end
  
  def update
    authorize @book
    if @book.update(book_params)
      redirect_to dashboard_path, notice: "Book sucessfully updated!"
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :price, :published)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end

