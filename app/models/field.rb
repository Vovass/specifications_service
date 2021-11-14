class Field < ApplicationRecord
  validates :title, presence: true
  validates :vocabulary_id, uniqueness: { scope: :retailer_id }
  has_rich_text :description

  belongs_to :retailer
  belongs_to :vocabulary
  has_many :variations

  before_validation :set_name

  private

  def set_name
    # self.title = self.title.empty? ? vocabulary.spec_name : self.title
    self.title = vocabulary.spec_name
  end
end

# 1.
# Когда отображается список для выбора vocabulary выводить сразу все с удобной сортировкой по матчам из названия
#