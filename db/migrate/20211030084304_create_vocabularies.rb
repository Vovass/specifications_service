class CreateVocabularies < ActiveRecord::Migration[6.1]
  def change
    create_table :vocabularies do |t|
      t.string :name, null: false, unique: true
      t.text :description
      t.string :spec_name

      t.timestamps
    end
  end
end
