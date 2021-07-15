class Match < ApplicationRecord
    has_many :scores
    belongs_to :scoreboard
end
