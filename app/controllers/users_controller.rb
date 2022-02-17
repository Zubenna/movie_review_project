class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  private

  def authenticate_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user == @user
  end
end
