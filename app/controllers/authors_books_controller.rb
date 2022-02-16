# I don't think that this controller is needed at all
class AuthorsBooksController < ApplicationController
  def index
    @records = policy_scope(AuthorsBook)
  end

end
