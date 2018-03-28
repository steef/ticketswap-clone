class TicketsController < ApplicationController
  before_action :find_listing, only: [:show, :new, :create, :update, :destroy] # DRY
  before_action :find_ticket, only: [:show, :update, :destroy] # DRY

  def show
    authorize @ticket # anyone can view
  end

  def new
    authorize @listing, :edit?
    @ticket = Ticket.new
  end

  def create
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
    authorize @listing, :create?
    if @listing.user_id == current_user.id
      redirect_to listing_ticket_path(@ticket.listing_id, @ticket), :alert => "You can't buy your own ticket"
    else
      @ticket.user_id = current_user.id
      @ticket.bought_at_date = Time.now
      @ticket.update(ticket_params)
      redirect_to listing_path(@listing)
    end
  end

  def destroy
    authorize @listing
    @ticket.destroy
    redirect_to listings_path
  end

  private

  def ticket_params
    # Strong params: We need to whitelist what can be updated by the user
    # Never trust user data
    params.permit(:listing_id, :user_id, :bought_at_date)
  end

  def find_listing
    @listing = Listing.find(params[:listing_id])
  end

  def find_ticket
    @ticket = Ticket.find(params[:id])
  end
end
