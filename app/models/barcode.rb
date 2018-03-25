class Barcode < ApplicationRecord
  belongs_to :ticket

  validates :barcode, presence: true
  validates :barcode, uniqueness: true, unless: :last_buyer

  private

  def last_buyer
    @barcode_first = Barcode.where(barcode: barcode).first
    @barcode_last = Barcode.where(barcode: barcode).last
    # will look if barcode already exists
    if @barcode_first.nil?
    else
      @ticket = Ticket.find_by id: ticket_id
      @listing = Listing.find_by id: @ticket.listing_id
      @listing_all = Listing.where(user_id: @listing.user_id)
      @ticket_all = Ticket.where(listing_id: @listing_all.ids)
      @barcode_all = Barcode.where(ticket_id: @ticket_all.ids).where(barcode: barcode)
      # goes trough all listings > tickets > barcodes of current user
      # and triers to find if current barcode is found
      if @barcode_all.count < 1
        # barcode can't be in the db more than once
        @ticket = Ticket.find_by id: ticket_id
        @listing = Listing.find_by id: @ticket.listing_id
        @barcode_last.ticket.user_id == @listing.user_id
        # checks if barcode seller id is same as last barcode buyer id
      else
      end
    end
  end
end
