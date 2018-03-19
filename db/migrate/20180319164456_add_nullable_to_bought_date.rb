class AddNullableToBoughtDate < ActiveRecord::Migration[5.1]
  def change
    change_column :tickets, :bought_at_date, :datetime, :null => true
  end
end
