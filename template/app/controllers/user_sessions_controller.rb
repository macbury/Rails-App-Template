class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = t('flash.notice.logged_in')
      redirect_back_or_default
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
		flash[:notice] = t('flash.notice.logged_out')
    redirect_to root_url
  end
end
