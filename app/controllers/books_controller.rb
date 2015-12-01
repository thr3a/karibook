class BooksController < ApplicationController

  # GET /books
  def new
    @book = Book.new
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path, notice: '登録に成功しました'
    else
      render :new
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:isbn, :name, :author, :publisher, :published_date)
    end
end
