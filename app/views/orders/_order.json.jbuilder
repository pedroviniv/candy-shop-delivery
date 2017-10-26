json.extract! order, :id, :title, :description, :deadline, :created_at, :updated_at
json.url order_url(order, format: :json)
