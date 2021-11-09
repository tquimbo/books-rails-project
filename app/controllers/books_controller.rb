class BooksController < ApplicationController

    def new 
        @book = Book.new
    end
    
    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to book_path(@book)
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end


    private

    def book_params
        params.require(:book).permit(:name, :author, :genre)
    end
    

end
