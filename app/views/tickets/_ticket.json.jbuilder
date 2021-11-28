json.extract! ticket, :id, :name, :description, :link, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
