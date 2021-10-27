class Field < ApplicationRecord
  validates :title, presence: true

  belongs_to :retailer
end
