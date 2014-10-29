class MapsController < ApplicationController

	def index
		@location = params[:user_location]
		if @location == ""
			@location = "USA"
		end
		if Map.findings(@location)["events"]
			@nearby_events = Map.findings(@location)["events"]["event"]
		end
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
