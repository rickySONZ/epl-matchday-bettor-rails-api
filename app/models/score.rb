class Score < ApplicationRecord

    belongs_to :user
    belongs_to :match

    validates :home_team, presence: true
    validates :away_team, presence: true
    validates :home_score, presence: true
    validates :away_score, presence: true
end
