class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string:name                     , null: false 
      t.string:item_detail              , null: false 
      t.integer:price                   , null: false 
      t.integer:category                , null: false 
      t.integer:status                  , null: false 
      t.integer:delivery_term           , null: false 
      t.integer:place_of_origin         , null: false 
      t.integer:shipping_status         , null: false 
      t.references:user                 , null: false
      t.timestamps
    end
  end
end
