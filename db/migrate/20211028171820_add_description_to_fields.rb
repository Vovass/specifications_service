class AddDescriptionToFields < ActiveRecord::Migration[6.1]
  def change
    add_column :fields, :description, :text
  end
end
