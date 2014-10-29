class MapsController < ApplicationController

	def index
		@location = params[:user_location]
		if @location == ""
			@location = "USA"
		end
		if Map.findings(@location)["events"]
			@nearby_events = Map.findings(@location)["events"]["event"]
		end
		# The locations_hash below takes in certain data from each event,
		# in this case, lat and long corrdinates, the event title (usually the artist's name)
		# the venue name, and address. This will be given to the google map
		# in the view so the pins can be plotted
		@locations_hash = Gmaps4rails.build_markers(@nearby_events) do |event, marker|
  		marker.lat event["venue"]["location"]["geo:point"]["geo:lat"]
  		marker.lng event["venue"]["location"]["geo:point"]["geo:long"]
			marker.infowindow event["title"] + "<br />" + event["venue"]["name"] + "<br />" + event["venue"]["location"]["street"]
		end
	end

	private

	def maps_params
		params.require(:user_location)
	end
end
