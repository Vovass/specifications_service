class Ticket < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_rich_text :description

  has_many :fields_tickets
  has_many :fields, through: :fields_tickets

  # Сделать set_link который автоматом генерируем ссылку на профитеро при создании из имени
  # а имя строго ограничить патерном (\W+)-\d+
end
