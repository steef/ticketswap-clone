class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
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
