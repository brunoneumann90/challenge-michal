class Order < ApplicationRecord
  # This is not needed
  belongs_to :authors_book
  belongs_to :user
end
