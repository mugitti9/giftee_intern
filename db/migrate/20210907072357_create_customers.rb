class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string  :name,    null: false
      t.string  :line_user_id, null: false, unique: true
      t.timestamps
    end
  end
end
