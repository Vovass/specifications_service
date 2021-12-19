class AddRetailerIdToFieldHistories < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :field_histories, :retailer, index: true
  end
end
