class Movie < ApplicationRecord
    belongs_to :user
    # belongs_to :user, :optional => true
    has_many :reviews

    has_one_attached :clip
    has_one_attached :thumbnail

    validate :acceptable_image

    def acceptable_image
        return unless thumbnail.attached? && clip.attached?
      
        unless thumbnail.byte_size <= 5.megabyte && clip.byte_size <= 20.megabyte
          errors.add(:thumbnail, "is too big or video is too big")
        end
      
        acceptable_types = ["image/jpeg", "image/png"]
        unless acceptable_types.include?(thumbnail.content_type)
          errors.add(:thumbnail, "must be a JPEG or PNG")
        end
    end
end
