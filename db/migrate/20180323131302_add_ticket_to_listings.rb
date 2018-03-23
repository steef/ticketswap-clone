class AddTicketToListings < ActiveRecord::Migration[5.1]
  def change
    add_reference :listings, :ticket, foreign_key: true
  end
end
