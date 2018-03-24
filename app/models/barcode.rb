class Barcode < ApplicationRecord
  belongs_to :ticket

  validates :barcode, presence: true
  validates :barcode, uniqueness: true, unless: :last_buyer

  def last_buyer
    @barcode = Barcode.find_by barcode: barcode
    @barcode.ticket.user_id == @barcode.ticket.listing
  end
end
