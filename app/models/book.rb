class Book < ApplicationRecord
    belongs_to :user 
    has_many :reviews
    has_many :users, through: :reviews 

    validates :author, presence: true

    
  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(ratings) desc')}


    
    

    
end
