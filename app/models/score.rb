class Score < ApplicationRecord

    belongs_to :user
    belongs_to :match

    validates: :home_team, presence: true
    validates: :away_team, presence: true
end
