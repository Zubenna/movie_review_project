require 'rails_helper'
RSpec.describe Review, type: :model do
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
