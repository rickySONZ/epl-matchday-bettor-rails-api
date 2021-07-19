require 'httparty'


class Api < ApplicationRecord

    def self.pull_matchday_data()
        @url = 'https://site.api.espn.com/apis/site/v2/sports/soccer/eng.1/scoreboard?dates=20210812-20210819'
        match_array = HTTParty.get(@url)
        count = 0
        match_array = match_array["events"]
        match_array.each do |match_hash|
            match_hash["competitions"].each do |m|
                if !(Match.find_by_uid(m["id"]))
                    newMatch = Match.create(:uid => m["id"],
                        :date => m["date"], 
                        :home_team => m["competitors"][0]["team"]["name"], 
                        :away_team => m["competitors"][1]["team"]["name"],
                        :home_score => m["competitors"][0]["score"],
                        :away_score => m["competitors"][1]["score"],
                        :home_logo => m["competitors"][0]["team"]["logo"],
                        :away_logo => m["competitors"][1]["team"]["logo"]
                    )
                    
                    newMatch.save
                end
            end
        end
    end
end
