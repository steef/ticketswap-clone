class Barcode < ApplicationRecord
  belongs_to :ticket

  validates :barcode, presence: true
  validates :barcode, uniqueness: true, unless: :last_buyer

  def last_buyer
    @barcode_first = Barcode.where(barcode: barcode).first
    @barcode_last = Barcode.where(barcode: barcode).last
    # will look if barcode already exists
    if @barcode_first.nil?
      true
    else
      if @barcode_first == @barcode_last
        # checks if first/last update are same
        @ticket = Ticket.find_by id: ticket_id
        @listing = Listing.find_by id: @ticket.listing_id
        @barcode_last.ticket.user_id == @listing.user_id
        # checks if barcode seller id is same as last barcode buyer id
        # same? responds with true
      else
        false
      end
    end
  end
end

# After ticket is bought for the second time, it can't be sold again
# Solution > Barcode.first / last check needs to be for specific user
