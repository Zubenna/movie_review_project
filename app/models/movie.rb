class Movie < ApplicationRecord
  belongs_to :user
  has_many :reviews

  has_one_attached :clip
  has_one_attached :thumbnail

  validate :acceptable_image

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :category, presence: true
  validates :director, presence: true, length: { in: 2..30 }
  validates :ratings, presence: true
  validates :movie_length, presence: true
  validates :user_id, presence: true

  self.per_page = 6

  def acceptable_image
    return unless thumbnail.attached? && clip.attached?

    unless thumbnail.byte_size <= 5.megabyte && clip.byte_size <= 30.megabyte
      errors.add(:thumbnail, 'is too big or video is too big')
    end

    acceptable_types = ['image/jpeg', 'image/png']
    errors.add(:thumbnail, 'must be a JPEG or PNG') unless acceptable_types.include?(thumbnail.content_type)
  end
end
