class ReviewsController < ApplicationController

    def new 
        @book = Book.find_by_id(params[:id])
        @review = @book.build_review
    end
    
    def create
    
    end
    
    def show
    
    end

    def index
        if !logged_in?
          redirect_if_not_logged_in
        else
          redirect_to user_path(current_user)
        end
      end


    
end
