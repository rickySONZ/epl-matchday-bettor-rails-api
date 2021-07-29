class Scoreboard < ApplicationRecord
    has_many :matches
    has_many :scores, through: :matches

    validates :start_date, presence: true
    validates :end_date, presence: true
end
