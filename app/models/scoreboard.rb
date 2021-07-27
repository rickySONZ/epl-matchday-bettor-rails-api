class Scoreboard < ApplicationRecord
    has_many :matches
    has_many :scores, through: :matches

    
end
