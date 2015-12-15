class KashidasisController < ApplicationController
  def index
    if session[:current_user]
      @books = Kashidashi.where(user_id: session[:current_user]['nickname'])
    end
  end

  def kariru
    if session[:current_user]
      if request.get?
        @kari = Kashidashi.new(kashidashi_params)
        @kari.user_id = session[:current_user]['nickname']
        render :kariru
      else
        @kari = Kashidashi.new(kashidashi_params)
        @kari.user_id = session[:current_user]['nickname']
        if @kari.save
          redirect_to root_path, notice: '貸出に成功しました'
        else
          redirect_to root_path, alert: '貸出に失敗しました<br>'+@kari.errors.full_messages.join("<br>")
        end
      end
    else
      redirect_to root_path, notice: '先にログインを行ってください'
    end

  end
  def kaesu
    if session[:current_user]
      if request.get?
        @kari = Kashidashi.find_by(isbn: params[:isbn])
        if @kari.nil?
          redirect_to root_path, alert: 'この本は返却できません'
        else
          render :kaesu
        end
      else
        @kari = Kashidashi.find(params[:id]).destroy
        redirect_to root_path, notice: '返却しました'
      end
    else
      redirect_to root_path, notice: '先にログインを行ってください'
    end
  end
  private
    # Only allow a trusted parameter "white list" through.
    def kashidashi_params
      params.permit(:user_id, :isbn)
    end
end
