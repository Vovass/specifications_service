class AddUserIdToFieldHistories < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :field_histories, :user, index: true
  end
end
