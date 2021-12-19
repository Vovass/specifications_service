class AddUserIdToVocabularyHistories < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :vocabulary_histories, :user, index: true
  end
end
