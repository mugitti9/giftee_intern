class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer     :sex,         null: false
      t.date        :birthday,    null: false
      
      t.references  :customer,    foreign_key: true,  null:false,  unique: true
      t.timestamps
    end
  end
end
