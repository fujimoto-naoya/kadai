class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    @user = User.find_for_github_oauth(request.env["omniauth.auth"], current_user)

    #user中から"omniauth.auth"の情報をハッシュ形式で取得
    #current_user : サインインしているユーザを取得 ログインユーザをモデルオブジェクトとして利用可

    if @user.persisted? #save済userであるかどうか boolean型で返す
      sign_in_and_redirect @user, :event => :authentication
      #sign_in_and_redirect @user : ログイン後のリダイレクト先を探しに行く
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
      # if is_navigational_format? : パスを分岐させる
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
      #redirect_to oauth_test_show_path
    end

  end
end
