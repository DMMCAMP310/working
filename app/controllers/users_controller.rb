class UsersController < ApplicationController
  before_action :set_user
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_without_password(user_params)
    redirect_to mypage_users_url
  end

  def mypage
    @user = current_user
  end
  
  private
    def set_user
      @user = current_user
    end
    
    def user_params
      params.permit(:name, :email)
    end
end
