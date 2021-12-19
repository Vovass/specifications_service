class AddUserIdToTickets < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :tickets, :user, index: true
  end
end
