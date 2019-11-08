class OauthTestController < ApplicationController

  before_action :require_login

  private

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to oauth_test_error_path
    end
  end


  skip_before_action :require_login, only: [:index, :error]

  def index
  end

  def show
  end

  def error
  end




end
