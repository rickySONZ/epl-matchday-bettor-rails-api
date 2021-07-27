class Match < ApplicationRecord
   
    belongs_to :scoreboard
    has_many :scores

    validates :home_team, presence: true
    validates :away_team, presence: true
    validates :home_logo, presence: true
    validates :away_logo, presence: true
    validates :uid, uniqueness: true
end
