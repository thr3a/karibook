class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  # GET /users
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: '登録に成功しました'
    else
      render :new
    end
  end
  # GET /users/:id/edit
  def edit
  end
  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      redirect_to root_path, notice: '編集に成功しました'
    else
      render :edit
    end
  end

  # DELETE /users/:isbn
  def destroy
    @user.destroy
    redirect_to root_path, notice: '削除に成功しました'
  end

  # POST /login
  def login
    if(params[:user_id].present? && User.find_by(id: params[:user_id]))
      session[:current_user] = params[:user_id]
      redirect_to root_path, notice: 'ログインしました'
    else
      redirect_to root_path, alert: '存在しないIDです'
    end
  end

  # POST /logout
  def logout
    reset_session
    redirect_to root_path, notice: 'ログアウトしました'
  end
  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:id, :name)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
