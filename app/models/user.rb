class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :retailers
  has_many :fields
  has_many :variations
  has_many :vocabularies
  has_many :comments
  has_many :field_histories
  has_many :vocabulary_histories
  has_many :tickets

  belongs_to :user_role
  after_create :set_default_role
  before_update :set_role_name

  def set_default_role
    self.update(role: "user")
  end

  def set_role_name
    self.role = self.user_role.role
  end

end
