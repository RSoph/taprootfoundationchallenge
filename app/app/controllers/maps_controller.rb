class MapsController < ApplicationController

	def index
		binding.pry
		if params[:user_location]
			@location = params[:user_location]
		else
			@location = "no location"
		end
	end

	private

	def maps_params
		params.require(:user_location)
	end
end
