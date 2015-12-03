class KashidasisController < ApplicationController
  def index
    @books = Book.all
    @users = User.all
    @kashidasis = Kashidashi.all
  end
  def kariru
    if request.get?
      @kari = Kashidashi.new(kashidashi_params)
      render :kariru
    else
      @kari = Kashidashi.new(kashidashi_params)
      if @kari.save
        redirect_to root_path, notice: '貸出に成功しました'
      else
        redirect_to root_path, alert: '貸出に失敗しました<br>'+@kari.errors.full_messages.join("<br>")
      end
    end
  end
  def kaesu
    if request.get?
      @kari = Kashidashi.find_by(isbn: params[:isbn], user_id: params[:user_id])
      if @kari.nil?
        redirect_to root_path, alert: 'この本は返却できません'
      else
        render :kaesu
      end
    else
      @kari = Kashidashi.find(params[:id]).destroy
      redirect_to root_path, notice: '返却しました'
    end
  end
  private
    # Only allow a trusted parameter "white list" through.
    def kashidashi_params
      params.permit(:user_id, :isbn)
    end
end
