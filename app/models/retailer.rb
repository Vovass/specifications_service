class Retailer < ApplicationRecord
  validates :title, presence: true

  has_many :fields
end
