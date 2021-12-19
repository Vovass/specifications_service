class FieldHistory < ApplicationRecord

  has_rich_text :description

  belongs_to :field
  belongs_to :retailer
  belongs_to :user

  before_create :tag_version_number

  private

  def tag_version_number
    self.version = generate_version_number
  end

  def generate_version_number
    (self.class.where(field_id: field_id)
         .maximum(:version) || 0) + 1
  end
end
