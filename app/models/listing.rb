class Listing < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy

  validates :selling_price, presence: true
  validates :description, presence: true
end
