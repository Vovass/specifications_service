class Retailer < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  belongs_to :user
  has_many :fields
  has_many :field_histories
  has_many :comments
end
