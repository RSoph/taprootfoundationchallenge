class Map < ActiveRecord::Base

	def self.findings(location)

		gsub_location = location.gsub(" ", "+")
		api_key = '84349af8e9e4fed796bd43485d8d4b9d'
		secret = '82ef4bc9e9456b4738dc689cf368f7e4'
		path = "http://ws.audioscrobbler.com/2.0/?method=geo.getevents&location=#{gsub_location}&api_key=#{api_key}&format=json"

    api_response = HTTParty.get(path)
    @json_hash = api_response.parsed_response
    return @json_hash

	end
end


# api_response = HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=geo.getevents&location=new+york&api_key=84349af8e9e4fed796bd43485d8d4b9d&format=json")
		
