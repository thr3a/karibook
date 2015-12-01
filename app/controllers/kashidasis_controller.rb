class KashidasisController < ApplicationController
  def index
    @books = Book.all
    @kashidasis = Kashidashi.all
  end
end
