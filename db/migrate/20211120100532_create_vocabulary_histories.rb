class CreateVocabularyHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :vocabulary_histories do |t|
      t.string :name
      t.text :description
      t.string :spec_name

      t.timestamps
    end
    add_belongs_to :vocabulary_histories, :vocabulary
  end
end
