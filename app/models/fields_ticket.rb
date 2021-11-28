class FieldsTicket < ApplicationRecord
  belongs_to :field
  belongs_to :ticket

  validates :field_id, uniqueness: { scope: :ticket_id }
end
