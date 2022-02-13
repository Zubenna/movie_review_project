class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    # before_action :check_admin

    # def index 
    #     @movies = Movie.all
    # end
    
    def index
      # @movies = Movie.paginate(page: params[:page])
      if params[:category].present? && params[:category] != "All"
        @movies = Movie.paginate.where(category: params[:category]).paginate(page: params[:page])
      else
        @movies = Movie.paginate(page: params[:page]).order(created_at: :desc)
      end
    end
    
    def show
        @reviews = Review.where(movie_id: @movie.id).order("created_at DESC")
        if @reviews.blank?
          @avg_review = 0
        else
          @avg_review = @reviews.average(:rating).round
       end
    end

    def new 
     @movie = current_user.movies.build
    end

    def edit
        @movie = Movie.new
    end

    def create 
      @movie = current_user.movies.build(movie_params)
      if @movie.save
      redirect_to @movie, notice: 'Movie was successfully created.' 
      else
       render :new
      end
    end

    def update
      if @movie.update(movie_params)
        redirect_to @movie, notice: 'Movie was successfully updated.' 
      else
        render :edit 
       end
    end

    def destroy
       @movie.destroy
        redirect_to redirect_to movies_path 
    end
    
    private

    def set_movie
    @movie = Movie.find(params[:id])
    end

    # def check_admin
    #     return unless admin_signed_in?
    #     redirect_to root_path, error: 'You are not allowed to access this part of the site'
    # end

    def movie_params
       params.require(:movie).permit(:title, :description, :movie_length, :director, :ratings, :thumbnail, :clip, :category, :user_id )
    end
    end