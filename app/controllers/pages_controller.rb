class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @records = AuthorsBook.all
  end

  def shopping_cart
    @orders = current_user.orders
  end
end
