class Listing < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy

  validates :selling_price, presence: true, numericality: { greater_than_or_equal_to: 5 }
  validates :description, presence: true
end
