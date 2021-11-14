class CreateVariations < ActiveRecord::Migration[6.1]
  def change
    create_table :variations do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_belongs_to :variations, :field
  end
end
