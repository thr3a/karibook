class KashidasisController < ApplicationController
  def index
    @books = Book.all
    @users = User.all
    @kashidasis = Kashidashi.all
  end
  def kariru
    isbn = params[:isbn]
    user_id = params[:user_id]
    if request.get?
      @kari = Kashidashi.new(kashidashi_params)
      render :confirm
    else
      @kari = Kashidashi.new(kashidashi_params)
      p kashidashi_params
      if @kari.save
        redirect_to root_path, notice: '貸出に成功しました'
      else
        redirect_to root_path, alert: '貸出に失敗しました<br>'+@kari.errors.full_messages.join("<br>")
      end
    end
  end
  def kaesu
    @kari = Kashidashi.find(params[:id]).destroy
    render json: {status: 200, message: "返しました"}
  end
  private
    # Only allow a trusted parameter "white list" through.
    def kashidashi_params
      params.permit(:user_id, :isbn)
    end
end
