class AddVocabularyIdToFields < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :fields, :vocabulary
  end
end
