class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :destroy]

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
  # GET /books/:isbn/edit
  def edit
  end
  # PATCH/PUT /books/:isbn
  def update
    if @book.update(book_params)
      redirect_to root_path, notice: '編集に成功しました'
    else
      render :edit
    end
  end

  # DELETE /books/:isbn
  def destroy
    @book.destroy
    redirect_to root_path, notice: '削除に成功しました'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:isbn, :name, :author, :publisher, :published_date)
    end

    def set_book
      @book = Book.find(params[:id])
    end
end
