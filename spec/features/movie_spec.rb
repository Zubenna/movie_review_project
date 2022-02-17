require 'rails_helper'
RSpec.describe Movie, type: :model do
  movie = Movie.create(title: 'Movie Test Test', description: 'Higly rated movie', movie_length: '3hrs',
                       director: 'Jack Baur', ratings: 4, thumbnail: nil, clip: nil, category: 'Action', user_id: 1)

  it 'is valid with valid attributes' do
    expect(movie).to be_valid
  end

  it 'is not valid without a title' do
    movie.title = nil
    expect(movie).to_not be_valid
  end

  it 'is not valid without a description' do
    movie.description = nil
    expect(movie).to_not be_valid
  end

  it 'is not valid without a movie length' do
    movie.movie_length = nil
    expect(movie).to_not be_valid
  end

  it 'is not valid without a movie director' do
    movie.director = nil
    expect(movie).to_not be_valid
  end

  it 'is not valid without movie ratings' do
    movie.ratings = nil
    expect(movie).to_not be_valid
  end

  it 'is not valid without movie category' do
    movie.category = nil
    expect(movie).to_not be_valid
  end
end
