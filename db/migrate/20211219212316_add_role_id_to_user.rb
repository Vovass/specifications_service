class AddRoleIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :users, :user_role, index: true
  end
end
