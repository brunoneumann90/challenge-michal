class AuthorsBook < ApplicationRecord
  belongs_to :book
  belongs_to :author
  has_many :orders
end
