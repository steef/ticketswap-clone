class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = policy_scope(Listing).order(created_at: :desc)
  end

  def show
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    authorize @listing
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
    # DRY
    @listing = Listing.find(params[:id])
    authorize @listing
  end
end
