require 'httparty'


class Api < ApplicationRecord


        @@end_date = Scoreboard.last.end_date
        @@start_date = Scoreboard.last.start_date
    def initialize
        @@end_date = Scoreboard.last.end_date
        @@start_date = Scoreboard.last.start_date
    end


    def self.change_dates
        date_change = @@end_date
        while Date.today > @@end_date.to_date do
            @@start_date = @@end_date
            @@end_date = @@end_date.to_date
            @@end_date = (@@end_date + 7).to_s.gsub("-","")
        end
        if date_change != @@end_date
            return true
        else
            return false
        end
    end

    def self.get_end_date
        @@end_date
    end

    def self.get_start_date
        @@start_date
    end

    def self.pull_matchday_data()
        if Api.change_dates()
            Api.change_dates
            @scoreboard = Scoreboard.create(start_date: @@start_date, end_date: @@end_date)
        end
        binding.pry
        @url = "https://site.api.espn.com/apis/site/v2/sports/soccer/eng.1/scoreboard?dates=#{@@start_date}-#{@@end_date}"
        match_array = HTTParty.get(@url)
        if match_array["events"]
            match_array = match_array["events"]
            match_array.each do |match_hash|
                match_hash["competitions"].each do |m|
                    if !(Match.find_by_uid(m["id"]))
                        newMatch = @scoreboard.matches.build(:uid => m["id"],
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
end
