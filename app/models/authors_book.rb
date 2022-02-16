class AuthorsBook < ApplicationRecord
  belongs_to :book
  belongs_to :author
  # This doesn't look correct - how can a joined table be the owner of an association?
  has_many :orders
end
