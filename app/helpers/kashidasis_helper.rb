module KashidasisHelper
  def is_login?
    return session[:current_user].present?
  end
end
