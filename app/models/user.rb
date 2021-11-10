class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :reviewed_books, through: :reviews, source: :book
  
    has_many :books
  
    validates :username, uniqueness: true
    validates :username, presence: true

end
