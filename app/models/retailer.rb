class Retailer < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  belongs_to :user
  has_many :fields
end
