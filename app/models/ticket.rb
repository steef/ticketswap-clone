class Ticket < ApplicationRecord
  belongs_to :listing
  has_one :user, :through => :listing
  has_many :barcodes, dependent: :destroy # ticket can have more than one barcode
end
