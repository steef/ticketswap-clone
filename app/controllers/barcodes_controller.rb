class BarcodesController < ApplicationController

  def show
    @ticket = ticket.find(params[:ticket_id])
    @barcode = Barcode.find(params[:id])
  end

  def new
    @ticket = Ticket.find(params[:ticket_id])
    @barcode = Barcode.new
  end

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @barcode = Barcode.new(barcode_params)
    @barcode.ticket = @ticket
    if @barcode.save
      redirect_to @barcode.ticket
    else
      render :new
    end
  end

  def edit
    @ticket = ticket.find(params[:ticket_id])
    @barcode = Barcode.find(params[:id])
  end

  def update
    @barcode.update(barcode_params)
    redirect_to barcode_path(@barcode)
  end

  def destroy
    @barcode = Barcode.find(params[:id])
    @barcode.destroy
    redirect_to listing_ticket_path
  end

  private

  def barcode_params
    # Strong params: We need to whitelist what can be updated by the user
    # Never trust user data
    params.permit(:ticket_id, :barcode)
  end
end
