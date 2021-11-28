class CreateTicketsFields < ActiveRecord::Migration[6.1]
  def change
    create_table :fields_tickets do |t|
      t.integer :ticket_id
      t.integer :field_id
    end
  end
end
