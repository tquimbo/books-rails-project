class ReviewsController < ApplicationController

    def new 
        @book = Book.find_by_id(params[:id])
        @review = @book.reviews.build
    end
    
    def create
      @review = current_user.reviews.build(review_params)
      if @review.save
        redirect_to review_path(@review)
      else
        render :new
      end
    end
    
    def show
        @review = Review.find_by_id(params[:id])
    end
    
    def index
      @reviews = Review.all
    end

    private

    def review_params
        params.require(:review).permit( :comment, :rating )
    end
  
  


    
end
