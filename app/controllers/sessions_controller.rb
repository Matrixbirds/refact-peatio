class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  def sign_in
      @current_user = User.sign_in session_params
      load_token
  end

  def sign_up
      @current_user = User.sign_up session_params
      load_token
  end

  def logout
      current_user.logout
  end

  def session_params
      params.require(:session).permit :email, :password
  end

  private :session_params
end
