class ReviewsController < ApplicationController

  def new
    if @book = Book.find_by_id(params[:book_id])
      @review = @book.reviews.build
    else
      @review = Review.new
    end
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review.user_id = session[:user_id]
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end
    
  def index
    # if params[:book_id]
    #   @book = Book.find_by_id(params[:book_id]) 
    #   @reviews = @book.reviews
    # else
    # @reviews = Review.all
    # end
  end

    
    def show
        @reviews = Review.find_by_id(params[:id])
    end
    
    private

    def review_params
        params.require(:review).permit( :comment, :rating, :book_id )
    end
  
  


    
end
