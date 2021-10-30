class Field < ApplicationRecord
  validates :title, presence: true
  has_rich_text :description

  belongs_to :retailer
end
