class Author < ApplicationRecord
  has_many :authors_books
  has_many :books, through: :authors_books

  # This should ideally go to a presenter
  def full_name
    "#{first_name} #{last_name}"
  end
end
