class Listing < ApplicationRecord
  has_many :tickets, dependent: :destroy
end
