class TicketsController < ApplicationController
  after_action :verify_authorized, except: [:update]

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

   def edit
        @spaceship = Spaceship.find(params[:id])
        authorize @spaceship
      end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(ticket_params)
    redirect_to listing_path
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
