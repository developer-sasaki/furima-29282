class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string:name 
      t.integer:price 
      t.integer:category_id
      t.integer:status_id
      t.integer:delivery_terms_id
      t.integer:place_of_origin_id
      t.integer:shipping_status_id
      t.references:user
      t.timestamps
    end
  end
end
