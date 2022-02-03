class Order < ApplicationRecord
  belongs_to :authors_book
  belongs_to :user
end
