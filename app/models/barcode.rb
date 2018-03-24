class Barcode < ApplicationRecord
  belongs_to :ticket

  validates :barcode, presence: true
end
