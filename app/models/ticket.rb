class Ticket < ApplicationRecord
  paginates_per 30

  validates :name, presence: true, uniqueness: true
  validates :link, format: { with: /\A(https:\/\/space.profitero.com).+/, message: "only Profitero space" }
  has_rich_text :description

  has_many :fields_tickets
  has_many :fields, through: :fields_tickets

  belongs_to :user

  before_validation :set_ticket_data

  private

  def set_ticket_data

    case self.name
    when "DA"
      self.name = "DA-#{Ticket.last.nil? ? 1 : check_last_ticket('DA')}"
      self.description = "Наладить работу скриптов в соответсвтии со спецификацией"
    when "QA"
      self.name = "QA-#{Ticket.last.nil? ? 1 : check_last_ticket('QA')}"
    else
      self.name
    end
    self.link = "https://space.profitero.com/jira/browse/#{self.name}"
  end

  def check_last_ticket(group)
    number = Ticket.all.select(:name).where("name like '#{group}%'").map {|el| el[:name]}.max[/(\d+)$/,1].to_i rescue 0
    number + 1
  end

  # Сделать set_link который автоматом генерируем ссылку на профитеро при создании из имени
  # а имя строго ограничить патерном (\W+)-\d+
end
