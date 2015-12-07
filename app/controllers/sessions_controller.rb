class SessionsController < ApplicationController
    def create
        data = request.env['omniauth.auth'].info
        # 指定されたチーム内にいるかどうか
        if data['team'] == Rails.application.secrets.slack_team
          User.create(id: data['nickname'], name: data['name'])
          session[:current_user] = data
          redirect_to root_path, notice: 'ログインしました'
        else
          redirect_to root_path, alert: '所属していないユーザーはログインできません'
        end
    end

    def destroy
        session[:current_user] = nil
        redirect_to root_path, notice: 'ログアウトしました'
    end

    def oauth_failure
        redirect_to root_path, notice: 'ログインに失敗しました'
    end
end
