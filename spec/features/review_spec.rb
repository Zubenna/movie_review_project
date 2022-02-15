require 'rails_helper'
RSpec.describe Review, type: :model do
  user = User.create(first_name: 'Jack', surname: 'Smith', username: 'Jackson', email: 'marcus@sample.com',
                     password: '123456', password_confirmation: '123456')
  movie = Movie.create(title: 'Movie Test two', description: 'Higly rated movie', movie_length: '3hrs',
                       director: 'Jack Baur', ratings: 4, thumbnail: nil, clip: nil, category: 'Action', user_id: 1)
  review = Review.create(rating: 7, comment: 'Very good', user_id: 1, movie_id: 1)

  it 'is valid with valid attributes' do
    expect(review).to be_valid
  end
  it 'is not valid without a rating' do
    review.rating = nil
    expect(review).to_not be_valid
  end

  it 'is not valid without a comment' do
    review.comment = nil
    expect(review).to_not be_valid
  end
end
