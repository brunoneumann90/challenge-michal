class AuthorsBooksController < ApplicationController
  def index
    @records = policy_scope(AuthorsBook)
  end

end
