class AddVersionToVocabularyHistories < ActiveRecord::Migration[6.1]
  def change
    add_column :vocabulary_histories, :version, :integer
  end
end
