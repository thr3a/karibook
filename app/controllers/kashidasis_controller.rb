class KashidasisController < ApplicationController
  def index
    @books = Book.all
    @users = User.all
    @kashidasis = Kashidashi.all
  end
end
