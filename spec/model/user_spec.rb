require 'rails_helper'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.describe User, type: :model do
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
