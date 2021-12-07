class Book < ApplicationRecord
    belongs_to :user 
    has_many :reviews
    has_many :users, through: :reviews 

    validates :author, presence: true

    scope :order_rating, -> {Book.joins(:reviews).group(:id).order('avg(rating) desc')}

    
  
    
    

    
end
