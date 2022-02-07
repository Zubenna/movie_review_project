class UsersController < ApplicationController
    before_action :authenticate_user!
    # before_action :authorize_user

    def index 
        @users = User.all
    end

    def show
        authenticate_user
        # @user_movies = @user.movies
        @users = User.find(params[:id])
    end

    private

    def authenticate_user
       @user = User.find(params[:id])
       redirect_to root_url unless current_user = @user
    end
end
