class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string:name                     , null: false 
      t.string:item_detail             , null: false 
      t.integer:price                   , null: false 
      t.integer:category_id             , null: false 
      t.integer:status_id               , null: false 
      t.integer:delivery_terms_id       , null: false 
      t.integer:place_of_origin_id      , null: false 
      t.integer:shipping_status_id      , null: false 
      t.references:user                 , null: false
      t.timestamps
    end
  end
end
