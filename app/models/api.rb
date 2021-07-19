require 'httparty'


class Api < ApplicationRecord

    @@end_date = '20210701'
    @@start_date ='20210624'

    def initialize
        @@end_date = '20210701'
        @@start_date ='20210624'
    end


    def self.change_dates
        while Date.today > @@end_date.to_date do
            @@start_date = @@end_date
            @@end_date = @@end_date.to_date
            @@end_date = (@@end_date + 7).to_s.gsub("-","")
        end
    end

    def self.get_end_date
        @@end_date
    end

    def self.get_start_date
        @@start_date
    end

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
