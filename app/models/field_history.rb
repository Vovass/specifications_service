class FieldHistory < ApplicationRecord

  belongs_to :field

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
