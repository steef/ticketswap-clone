class BarcodesController < ApplicationController
  before_action :find_ticket, only: [:show, :new, :create, :destroy] # DRY
  before_action :find_barcode, only: [:show, :destroy] # DRY
  before_action :find_listing, only: [:show, :new, :create, :destroy] # DRY

  def show
    authorize @listing, :edit? # only creator (who can edit) can view
  end

  def new
    authorize @listing, :edit?
    @barcode = Barcode.new
  end

  def create
    @barcode = Barcode.new(barcode_params)
    @barcode.ticket = @ticket
    authorize @listing, :edit?
    if @barcode.save
      redirect_to listing_ticket_path(@ticket.listing_id, @ticket)
      # We can still access the listing_id because this is stored inside @ticket
    else
      render :new
    end
  end

  def destroy
    authorize @listing
    @barcode.destroy
    redirect_to listing_ticket_path(@ticket.listing_id, @ticket)
  end

  private

  def barcode_params
    # Strong params: We need to whitelist what can be updated by the user
    # Never trust user data
    params.require(:barcode).permit(:ticket_id, :barcode)
  end

  def find_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def find_barcode
    @barcode = Barcode.find(params[:id])
  end

  def find_listing
    @listing = Listing.find(@ticket.listing_id)
  end
end
