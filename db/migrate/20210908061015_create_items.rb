class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :brand_id,    null: false
      t.integer :item_id,     null: false
      t.string  :detail_use,  null: false

      t.timestamps
    end
  end
end
