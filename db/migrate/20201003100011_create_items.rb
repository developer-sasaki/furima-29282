class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string:name 
      t.integer:price 
      t.integer:category_id             , null: false 
      t.integer:status_id               , null: false 
      t.integer:delivery_terms_id       , null: false 
      t.integer:place_of_origin_id      , null: false 
      t.integer:shipping_status_id      , null: false 
      t.references:user
      t.timestamps
    end
  end
end
