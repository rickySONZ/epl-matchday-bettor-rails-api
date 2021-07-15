require 'httparty'

class Api < ApplicationRecord

    def self.pull_matchday_data()
        @url = 'http://api.football-data.org/v2/competitions/PL/matches/?matchday=22'
        match_array = HTTParty.get(@url, :headers => { 'X-Auth-Token' => ENV['SECRET'] } )
        # match_array.each do |match_hash|
        match_array
    end
end
