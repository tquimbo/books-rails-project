class BooksController < ApplicationController

    def index
        @books = Book.all
    end

    def new 
        @book = Book.new
    end
    
    def create
        @book = Book.new(book_params)
        @book.user_id = session[:user_id]
        if @book.save
            redirect_to book_path(@book)
        else
            render :new
        end
    end

    def show
        @book = Book.find_by(id: params[:id])
    if !@book
      flash[:error] = "Unauthorized."
      redirect_to new_book_path(@book)
        end
    end


    private

    def book_params
        params.require(:book).permit(:name, :author, :genre)
    end
    

end
