class CreateFields < ActiveRecord::Migration[6.1]
  def change
    create_table :fields do |t|
      t.string :title

      t.timestamps
    end
    add_belongs_to :fields, :retailer
  end
end
