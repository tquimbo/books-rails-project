class Review < ApplicationRecord
    belongs_to :user
    belongs_to :book

    validates :rating, numericality: {greater_than: 0, less_than_or_equal_to: 10}, presence: true
    validates :comment, length: { minimum: 5 }, presence: true
  

end
