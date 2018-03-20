class BarcodesController < ApplicationController
def new
    @listing = Listing.find(params[:listing_id])
    @barcode = Barcode.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @barcode = Barcode.new(barcode_params)
    @barcode.listing = @listing
    if @barcode.save
      redirect_to @barcode.listing
    else
      render :new
    end
  end

  def destroy
    @barcode = Barcode.find(params[:id])
    @barcode.destroy
    redirect_to listings_path
  end

  private

  def barcode_params
    # Strong params: We need to whitelist what can be updated by the user
    # Never trust user data
    params.require(:barcode).permit(:ticket_id, :barcode)
  end
end
