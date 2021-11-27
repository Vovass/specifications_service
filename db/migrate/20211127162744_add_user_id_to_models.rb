class AddUserIdToModels < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :fields, :user, index: true
    add_belongs_to :vocabularies, :user, index: true
    add_belongs_to :retailers, :user, index: true
    add_belongs_to :variations, :user, index: true
  end
end
