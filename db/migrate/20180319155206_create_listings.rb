class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.integer :selling_price
      t.string :description

      t.timestamps
    end
  end
end
