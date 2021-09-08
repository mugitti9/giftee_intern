class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string      :ticket_code,     null: false
      t.string      :request_code,    null: false
      t.string      :url,             null: false
      t.string      :status,          null: false

      t.datetime    :available_begin, null: false
      t.datetime    :available_end,   null: false
      t.datetime    :exchanged_at,    null: false
      t.datetime    :disabled_at,     null: false
      t.references  :customer,  foreign_key: true,  null:false

      t.timestamps
    end
  end
end
