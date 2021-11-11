class Review < ApplicationRecord
    belongs_to :user
    belongs_to :book

    validates :rating, numericality: {greater_than: 0, less_than_or_equal_to: 10}, presence: true



    validates :book, uniqueness: { scope: :user, message: "has already been reviewed by you"  }

  
  

end
