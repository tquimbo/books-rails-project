class ReviewsController < ApplicationController


  def index
      
  end

  def new
    if @book = Book.find_by_id(params[:book_id])
      @review = @book.reviews.build
    else
      @review = Review.new
    end
  end

  def create
    @review = Review.new(review_params)
    binding.pry
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end
    
 

    
    def show
        @reviews = Review.find_by_id(params[:id])
    end
    
    private

    def review_params
        params.require(:review).permit( :comment, :rating, :book_id )
    end
  
  


    
end
