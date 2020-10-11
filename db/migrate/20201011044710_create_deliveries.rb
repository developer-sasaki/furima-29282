class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :post_code           , null: false
      t.integer :city               , null: false
      t.string :street1             , null: false
      t.string :building            , null: false
      t.string :phone               , null: false
      t.references :item_purchase   , null: false,foreign_key: true

      t.timestamps
    end
  end
end
