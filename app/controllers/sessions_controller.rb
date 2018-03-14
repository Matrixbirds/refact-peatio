class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  def create
      @user = User.sign_in session_params
  end

  def destory
      clear_session_biz
      clear_session_state
  end

  def session_params
      params.require(:data).permit :phone, :ticket_code
  end

  private :session_params
end
