class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :set_movie

  def new
    @review = Review.new
  end

  def edit; end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.movie_id = @movie.id
    if @review.save
      redirect_to @movie, notice: 'Review was successfully created.'
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: 'Review was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
