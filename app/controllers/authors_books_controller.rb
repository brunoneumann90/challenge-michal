class AuthorsBooksController < ApplicationController
  def index
    @records = AuthorsBook.all
  end

end
