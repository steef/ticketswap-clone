class BarcodesController < ApplicationController

  def show
    @ticket = Ticket.find(params[:ticket_id])
    @barcode = Barcode.find(params[:id])
    @listing = ticket.listing_id
    authorize @listing # only creator can view
  end

  def new
    @ticket = Ticket.find(params[:ticket_id])
    @barcode = Barcode.new
    @listing = Listing.find(@ticket.listing_id)
    authorize @listing
  end

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @barcode = Barcode.new(barcode_params)
    @barcode.ticket = @ticket
    @listing = Listing.find(@ticket.listing_id)
    authorize @listing
    if @barcode.save
      redirect_to listing_ticket_path(@ticket.listing_id, @ticket)
      # We can still access the listing_id because this is stored inside @ticket
    else
      render :new
    end
  end

  def destroy
    @listing = Listing.find(params[:listing_id])
    authorize @listing
    @ticket = Ticket.find(params[:ticket_id])
    @barcode = Barcode.find(params[:id])
    @barcode.destroy
    redirect_to listing_ticket_path(@ticket.listing_id, @ticket)
  end

  private

  def barcode_params
    # Strong params: We need to whitelist what can be updated by the user
    # Never trust user data
    params.require(:barcode).permit(:ticket_id, :barcode)
  end
end
