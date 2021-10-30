class Retailer < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :fields
end
