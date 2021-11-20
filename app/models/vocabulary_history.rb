class VocabularyHistory < ApplicationRecord
  validates :vocabulary, presence: true

  has_rich_text :description
  belongs_to :vocabulary

  before_create :tag_version_number

  private

  def tag_version_number
    binding.pry
    self.version = generate_version_number
  end

  def generate_version_number
    (self.class.where(vocabulary_id: vocabulary_id)
         .maximum(:version) || 0) + 1
  end
end
