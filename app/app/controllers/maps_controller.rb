class MapsController < ApplicationController

	def index
		if params[:user_location]
			@location = params[:user_location]
		else
			@location = "no location"
		end
		if Map.findings(@location)["events"]
			@nearby_events = Map.findings(@location)["events"]["event"]
		end
	end

	private

	def maps_params
		params.require(:user_location)
	end
end
