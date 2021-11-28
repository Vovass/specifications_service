class CreateFieldHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :field_histories do |t|
      t.string :fields_title
      t.string :variation_name
      t.text :description
      t.integer :version
      t.string :vocabulary_name

      t.timestamps
    end
    add_belongs_to :field_histories, :field, index: true
  end
end
