class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string      :ticket_code,     null: false
      t.string      :request_code,    null: false
      t.string      :url,             null: false
      t.string      :status,          null: false

      t.datetime    :available_begin
      t.datetime    :available_end
      t.datetime    :exchanged_at
      t.datetime    :disabled_at

      t.references  :customer,  foreign_key: true,  null:false
      t.timestamps
    end
  end
end
