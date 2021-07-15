require 'httparty'

class Api < ApplicationRecord

    def self.pull_matchday_data()
        @url = 'https://site.api.espn.com/apis/site/v2/sports/soccer/eng.1/scoreboard?dates=20210812-20210819'
        match_array = HTTParty.get(@url )
        # match_array.each do |match_hash|
        match_array
    end

    def pull_team_data()
        url = 'http://api.football-data.org/v2/competitions/PL/matches/?matchday=22'
        team_array = HTTParty.get(@url )
    end
end
