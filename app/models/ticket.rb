class Ticket < ApplicationRecord
  belongs_to :listing
  belongs_to :user # only if the ticket is bought
  has_many :barcodes # ticket can have more than one barcode
end
