class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index]
  before_action :authorize_admin, only: %i[create update destroy]

  def index
    sort_movie
    @movies = @sorted.paginate(page: params[:page])
  end

  def show
    @reviews = Review.where(movie_id: @movie.id).order('created_at DESC')
    avg_reviews
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

  def avg_reviews
    @avg_review = if @reviews.blank?
                    0
                  else
                    @reviews.average(:rating).round
                  end
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def sort_movie
    @movies = if params[:category].present? && params[:category] != 'All'
                Movie.where(category: params[:category])
              else
                Movie.order(created_at: :desc)
              end
    @sorted = @movies
    @sorted
  end

  def authorize_admin
    return if current_user.admin?

    redirect_to root_path, notice: 'Admins only.'
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :movie_length, :director, :ratings, :thumbnail, :clip,
                                  :category, :user_id)
  end
end
