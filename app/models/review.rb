class Review < ApplicationRecord
    belongs_to :user
    belongs_to :movie

    validates :rating, presence: true
    validates :comment, presence: true, length: { maximum: 300 }

    def blank_stars
        10 - rating.to_i
    end
end
