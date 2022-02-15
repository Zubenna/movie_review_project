class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :movies
  has_many :reviews, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { in: 2..15 }
  validates :first_name, presence: true
  validates :surname, presence: true
end
