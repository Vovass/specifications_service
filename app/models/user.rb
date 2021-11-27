class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :retailers
  has_many :fields
  has_many :variations
  has_many :vocabularies

  after_create :set_default_role

  def set_default_role
    self.update(role: "user")
  end

end
