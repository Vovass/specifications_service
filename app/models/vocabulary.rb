class Vocabulary < ApplicationRecord
  validates :name, presence: true

  has_rich_text :description
  has_many :fields
end
