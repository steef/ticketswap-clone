class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  def destroy
    @listing.destroy
    redirect_to listings_path, :alert => "Listing deleted"
  end

  private

  def listing_params
    # Strong params: We need to whitelist what can be updated by the user
    # Never trust user data
    params.require(:listing).permit(:selling_price, :description)
  end

  def find_listing
    # Keeping the code DRY
    @listing = Listing.find(params[:id])
  end
end
