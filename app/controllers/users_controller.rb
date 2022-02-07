class UsersController < ApplicationController
    before_action :authenticate_user!
    # before_action :authorize_user

    def index 
        @users = User.all
    end

    # def show
    #     # @movie = Movie.with_attached_thumbnail && Movie.with_attached_clip
    #     @movie = Movie.find(params[:id])
    # end


    private

    def authenticate_user
       @user = User.find(params[:id])
       redirect_to root_url unless current_user = @user
    end
end
