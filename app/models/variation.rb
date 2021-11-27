class Variation < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { scope: :field_id }
  has_rich_text :description

  belongs_to :field
  belongs_to :user
end
