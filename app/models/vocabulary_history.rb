class VocabularyHistory < ApplicationRecord
  paginates_per 50

  validates :vocabulary, presence: true

  has_rich_text :description
  belongs_to :vocabulary
  belongs_to :user

  before_create :tag_version_number

  private

  def tag_version_number
    self.version = generate_version_number
  end

  def generate_version_number
    (self.class.where(vocabulary_id: vocabulary_id)
         .maximum(:version) || 0) + 1
  end
end
