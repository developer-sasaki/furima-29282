class ApplicationController < ActionController::Base
  # デフォルトであったやつ↓
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  # リダイレクト処理を用意しましょう-あってるかな？↓
  before_action :move_to_index, except: [:index, :show]

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
# ここも入れてみた↓
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end

end