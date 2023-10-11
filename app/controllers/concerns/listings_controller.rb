class ListingsController < ApplicationController
		before_action :set_post, only: [:show, :edit, :update, :destroy]
	
	def index
		@listings = Listing.all
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = current_user.listings.create(post_params)

		if @listing.save
			redirect_to listing_path(@listing)
		else
			render :new 
		end
	end

	def show
	end

	def edit
	end

	def update
		@listing.update(post_params)

		if @listing.save
			redirect_to listing_path(@listing)
		else
			render :edit 
		end
	end

	def destroy
		@listing.destroy
		redirect_to listings_path(@listings)
	end

	private
		def set_post
			@listing = Listing.find(params[:id])
		end

		def post_params
			params.require(:listing).permit(:title, :property_type, :location, :rooms, :capacity, :description, :price, :available)
		end
end