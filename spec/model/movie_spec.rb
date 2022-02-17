require 'rails_helper'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.describe Movie, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:reviews) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:ratings) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:movie_length) }
  end
end
