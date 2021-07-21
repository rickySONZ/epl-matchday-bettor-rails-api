class Match < ApplicationRecord
   
    belongs_to :scoreboard
    has_many :scores

end
