class Vocabulary < ApplicationRecord
  validates :name, :spec_name, presence: true
  validates :name, format: { with: /\A([a-z_]+)\z/, message: "consist of English letters only; allows only low register letters and underlining" }
  validates :name, :spec_name, uniqueness: true

  has_rich_text :description

  belongs_to :user

  has_many :fields
  has_many :vocabulary_histories
end
