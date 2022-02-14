require 'rails_helper'
RSpec.describe User, type: :model do
  user = User.create(first_name: 'Jack', surname: 'Smith', username: 'Benzo', email: 'merks@sample.com',
                     password: '123456', password_confirmation: '123456')
  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end
  it 'is not valid without a first_name' do
    user.first_name = nil
    expect(user).to_not be_valid
  end
  it 'is not valid without a surname' do
    user.surname = nil
    expect(user).to_not be_valid
  end
  it 'is not valid without a usrname' do
    user.username = nil
    expect(user).to_not be_valid
  end
  it 'is not valid without an email' do
    user.email = nil
    expect(user).to_not be_valid
  end
  it 'is not valid without a password' do
    user.password = nil
    expect(user).to_not be_valid
  end
end
