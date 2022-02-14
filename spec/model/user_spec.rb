require 'rails_helper'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.describe User, type: :model do
  before :each do
    user = User.create(first_name: 'Jack', surname: 'Smith', username: 'Jackson', email: 'techy@sample.com',
                       password: '123456', password_confirmation: '123456')
    movie = Movie.create(title: 'Movie Test Five', description: 'Higly rated movie', movie_length: '3hrs',
                         director: 'Jack Baur', ratings: 4, thumbnail: nil, clip: nil, category: 'Action', user_id: 1)
    review = Review.create(rating: 7, comment: 'Very good', user_id: 1, movie_id: 1)
  end

  describe 'associations' do
    it { should have_many(:reviews) }
    it { should have_many(:movies) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:surname) }
    it { should validate_presence_of(:username) }
  end
end
