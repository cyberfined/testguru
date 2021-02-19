class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(login: params[:login])
    if @user&.authenticate(params[:password])
      set_session_user_and_redirect(@user)
    else
      flash.now.alert = 'Wrong login or password'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to tests_path
  end
end
