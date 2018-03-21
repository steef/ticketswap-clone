class TicketsController < ApplicationController

  def show
    @listing = Listing.find(params[:listing_id])
    @ticket = Ticket.find(params[:id])
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @ticket = Ticket.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @ticket = Ticket.new(ticket_params)
    @ticket.listing = @listing
    if @ticket.save
      redirect_to @ticket.listing
    else
      render :new
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to listings_path
  end

  private

  def ticket_params
    # Strong params: We need to whitelist what can be updated by the user
    # Never trust user data
    params.permit(:listing_id, :bought_by_user_id, :bought_at_date)
  end
end
