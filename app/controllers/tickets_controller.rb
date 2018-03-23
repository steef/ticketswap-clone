class TicketsController < ApplicationController

  def show
    @listing = Listing.find(params[:listing_id])
    @ticket = Ticket.find(params[:id])
    authorize @ticket # anyone can view
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @ticket = Ticket.new
    authorize @listing, :edit?
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @ticket = Ticket.new(ticket_params)
    @ticket.listing = @listing
    authorize @listing, :edit?
    if @ticket.save
      redirect_to @ticket.listing
    else
      render :new
    end
  end

  def update
    @listing = Listing.find(params[:listing_id])
    authorize @listing
    @ticket = Ticket.find(params[:id])
    @ticket.user_id = current_user.id
    @ticket.bought_at_date = Time.now
    @ticket.update(ticket_params)
    redirect_to listing_path(@listing)
  end

  def destroy
    @listing = Listing.find(params[:listing_id])
    authorize @listing
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to listings_path
  end

  private

  def ticket_params
    # Strong params: We need to whitelist what can be updated by the user
    # Never trust user data
    params.permit(:listing_id, :user_id, :bought_at_date)
  end
end
