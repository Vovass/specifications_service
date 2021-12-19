class Retailer < ApplicationRecord
  paginates_per 30

  validates :title, presence: true, uniqueness: true

  belongs_to :user
  has_many :fields
  has_many :field_histories
  has_many :comments

  def self.search(search)
    where("title like '#{search}%'") if search
  end
end
