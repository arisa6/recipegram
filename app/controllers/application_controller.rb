class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? #ユーザーのページにアクセスする前にprivateを実行する
  
  
  private#このcontroller内でしか呼び出されないメソッド
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])   #sign_upの際にusernameを許可するメソッド
  end
end
