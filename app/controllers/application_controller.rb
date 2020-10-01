class ApplicationController < ActionController::Base
  # デフォルトであったやつ↓
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!
  # ↑itemsコントローラーに移動
  # リダイレクト処理を用意しましょう-あってるかな？↓
  # before_action :move_to_index, except: [:index, :show]

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:last_name_zenkaku_kanji,:first_name_zenkaku_kanji,:last_name_kana,:first_name_kana,:birth_day])
  end
 # ここも入れてみた↓
  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to new_user_session_path
  #   end
  # end
end