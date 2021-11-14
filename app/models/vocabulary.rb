class Vocabulary < ApplicationRecord
  validates :name, :spec_name, presence: true
  validates :name, format: { with: /\A([a-z_]+)\z/, message: "consist from only english allows letters with low register and underlining" }

  has_rich_text :description
  has_many :fields
end
