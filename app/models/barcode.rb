class Barcode < ApplicationRecord
  belongs_to :ticket

  validates :barcode, presence: true
  validates :barcode, uniqueness: true, unless: :last_buyer

  def last_buyer
    @barcode = Barcode.find_by barcode: barcode
    unless @barcode.nil?
      @ticket = Ticket.find_by id: ticket_id
      @listing = Listing.find_by id: @ticket.listing_id
      @barcode.ticket.user_id == @listing.user_id
    else
      false
    end
  end
end
