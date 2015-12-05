class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :destroy]

  # GET /books
  def index
    if session[:current_user]
      if params[:keyword].present?
        @books = Book.where("name like '%" + params[:keyword] + "%'")
      else
        @books = Book.all
      end
      @books = @books.paginate(page: params[:page], per_page: 10)
    else
      redirect_to root_path, alert: 'まずはログインしてください'
    end
  end
  # GET /books
  def new
    @book = Book.new
    if params[:isbn].present?
      @preset_data = get_book_info_from_isbn(params[:isbn]).to_json
    end
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

    def get_book_info_from_isbn isbn
      res = Amazon::Ecs.item_search(
        isbn,
        search_index: 'Books',
        response_group: 'Medium',
        country: 'jp'
      )
      if res.first_item.nil?
        return false
      else
        return{
          isbn: isbn,
          name: res.first_item.get('ItemAttributes/Title'),
          author: res.first_item.get('ItemAttributes/Author'),
          publisher: res.first_item.get('ItemAttributes/Manufacturer'),
          published_date: res.first_item.get('ItemAttributes/PublicationDate')
        }
      end
    end
end
